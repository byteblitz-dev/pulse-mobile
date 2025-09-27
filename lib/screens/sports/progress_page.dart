import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:pulse/services/api_service.dart';
import 'package:pulse/services/auth_service.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({super.key});

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  bool _loading = true;
  List<dynamic> _endurance = const [];
  List<dynamic> _shuttle = const [];
  String? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final userId = AuthService.userId;
    if (userId == null) {
      setState(() {
        _error = 'You must be logged in.';
        _loading = false;
      });
      return;
    }
    try {
      final res = await Future.wait([
        ApiService.fetchEnduranceRunResults(userId: userId),
        ApiService.fetchShuttleRunResults(userId: userId),
      ]);
      setState(() {
        _endurance = res[0];
        _shuttle = res[1];
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _loading = false;
      });
    }
  }

  Map<String, dynamic>? _latestAndPrev(List<dynamic> items) {
    if (items.isEmpty) return null;
    final sorted = [...items];
    sorted.sort((a, b) {
      final da = DateTime.tryParse(a['date']?.toString() ?? a['timestamp']?.toString() ?? '');
      final db = DateTime.tryParse(b['date']?.toString() ?? b['timestamp']?.toString() ?? '');
      return (db ?? DateTime.fromMillisecondsSinceEpoch(0))
          .compareTo(da ?? DateTime.fromMillisecondsSinceEpoch(0));
    });
    final latest = sorted.first;
    final prev = sorted.length > 1 ? sorted[1] : null;
    return {'latest': latest, 'prev': prev};
  }

  List<FlSpot> _enduranceSpots() {
    // expect items with distance_m and date
    final sorted = [..._endurance];
    sorted.sort((a, b) {
      final da = DateTime.tryParse(a['date']?.toString() ?? a['timestamp']?.toString() ?? '');
      final db = DateTime.tryParse(b['date']?.toString() ?? b['timestamp']?.toString() ?? '');
      return (da ?? DateTime.fromMillisecondsSinceEpoch(0))
          .compareTo(db ?? DateTime.fromMillisecondsSinceEpoch(0));
    });
    double i = 0;
    return sorted.map((e) {
      final dist = double.tryParse(e['distance_m']?.toString() ?? '0') ?? 0.0;
      final spot = FlSpot(i, dist / 1000.0); // km
      i += 1.0;
      return spot;
    }).toList();
  }

  List<BarChartGroupData> _shuttleBars() {
    final sorted = [..._shuttle];
    sorted.sort((a, b) {
      final da = DateTime.tryParse(a['date']?.toString() ?? a['timestamp']?.toString() ?? '');
      final db = DateTime.tryParse(b['date']?.toString() ?? b['timestamp']?.toString() ?? '');
      return (da ?? DateTime.fromMillisecondsSinceEpoch(0))
          .compareTo(db ?? DateTime.fromMillisecondsSinceEpoch(0));
    });
    int x = 0;
    return sorted.map((e) {
      // time mm:ss:SS to seconds
      final timeStr = e['time']?.toString() ?? '00:00:00';
      final parts = timeStr.split(':');
      double seconds = 0;
      if (parts.length == 3) {
        final m = int.tryParse(parts[0]) ?? 0;
        final s = int.tryParse(parts[1]) ?? 0;
        final cs = int.tryParse(parts[2]) ?? 0; // centiseconds
        seconds = m * 60 + s + cs / 100.0;
      }
      final bar = BarChartGroupData(x: x, barRods: [
        BarChartRodData(toY: seconds, color: Colors.deepPurpleAccent),
      ]);
      x += 1;
      return bar;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    if (_error != null) {
      return Scaffold(
        appBar: AppBar(title: const Text('My Progress'), backgroundColor: Colors.deepPurpleAccent),
        body: Center(child: Text(_error!)),
      );
    }

    final endSummary = _latestAndPrev(_endurance);
    final shSummary = _latestAndPrev(_shuttle);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("My Progress"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: RefreshIndicator(
        onRefresh: _load,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            // Summary cards
            if (endSummary != null)
              _SummaryCard(
                title: 'Endurance Run',
                latest: 'Distance: ${(double.tryParse(endSummary['latest']['distance_m']?.toString() ?? '0') ?? 0) / 1000.0} km',
                previous: endSummary['prev'] == null
                    ? 'No previous result'
                    : 'Prev: ${(double.tryParse(endSummary['prev']['distance_m']?.toString() ?? '0') ?? 0) / 1000.0} km',
              ),
            if (shSummary != null)
              _SummaryCard(
                title: 'Shuttle Run',
                latest: 'Time: ${shSummary['latest']['time'] ?? '-'}',
                previous: shSummary['prev'] == null
                    ? 'No previous result'
                    : 'Prev: ${shSummary['prev']['time'] ?? '-'}',
              ),
            const SizedBox(height: 16),

            // Endurance line chart
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Endurance Progress (km)', style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 220,
                      child: LineChart(
                        LineChartData(
                          borderData: FlBorderData(show: true),
                          titlesData: const FlTitlesData(show: true),
                          gridData: const FlGridData(show: true),
                          lineBarsData: [
                            LineChartBarData(
                              isCurved: true,
                              color: Colors.deepPurpleAccent,
                              barWidth: 3,
                              spots: _enduranceSpots(),
                              dotData: const FlDotData(show: false),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Shuttle bar chart
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Shuttle Run Time (s) – lower is better', style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 220,
                      child: BarChart(
                        BarChartData(
                          borderData: FlBorderData(show: true),
                          gridData: const FlGridData(show: true),
                          titlesData: const FlTitlesData(show: false),
                          barGroups: _shuttleBars(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final String title;
  final String latest;
  final String previous;
  const _SummaryCard({required this.title, required this.latest, required this.previous});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(latest),
            Text(previous),
          ],
        ),
      ),
    );
  }
}
