import 'dart:convert';
import 'package:http/http.dart' as http;
import 'auth_service.dart';

class ApiConfig {
  // ✅ Your production backend
  static const String baseUrl = 'https://backend-production-e915.up.railway.app';

  // ✅ Default headers
  static const Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
}

class ApiService {
  /// Build full URL
  static Uri _uri(String path) => Uri.parse('${ApiConfig.baseUrl}$path');

  /// Merge headers with auth
  static Map<String, String> _headers({Map<String, String>? extra}) {
    final auth = AuthService.getAuthHeaders();
    return {
      ...ApiConfig.headers,
      ...auth,
      if (extra != null) ...extra,
    };
  }

  // ---------------- AUTH ----------------

  /// LOGIN
  static Future<Map<String, dynamic>> login(String email, String password) async {
    final url = _uri('/auth/athlete/signin'); // ✅ Updated route
    try {
      final response = await http.post(
        url,
        headers: _headers(),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print("✅ Login API success: $data");
        return data;
      } else {
        print("❌ Login API failed: ${response.statusCode} → ${response.body}");
        return {
          'success': false,
          'message': 'Login failed',
          'statusCode': response.statusCode,
          'body': response.body,
        };
      }
    } catch (e) {
      print("⚠️ Login API error: $e");
      rethrow;
    }
  }

  /// REGISTER
  static Future<Map<String, dynamic>> register(
      String name,
      String email,
      String password,
      {int? age}) async {
    final url = _uri('/auth/athlete/signup'); // ✅ Updated route
    try {
      final response = await http.post(
        url,
        headers: _headers(),
        body: jsonEncode({
          'name': name,
          'email': email,
          'password': password,
          if (age != null) 'age': age,
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        print("✅ Register API success: $data");
        return data;
      } else {
        print("❌ Register API failed: ${response.statusCode} → ${response.body}");
        return {
          'success': false,
          'message': 'Registration failed',
          'statusCode': response.statusCode,
          'body': response.body,
        };
      }
    } catch (e) {
      print("⚠️ Register API error: $e");
      rethrow;
    }
  }

  static Future<Map<String, dynamic>> submitShuttleRunResult({
    required String userId,
    required String time, // mm:ss:SS
    required DateTime date,
  }) async {
    final response = await http.post(
      _uri('/shuttle-run'),
      headers: _headers(),
      body: jsonEncode({
        'userId': userId,
        'time': time,
        'date': date.toIso8601String(),
      }),
    );
    if (response.statusCode >= 200 && response.statusCode < 300) {
      final data = jsonDecode(response.body);
      print("✅ Shuttle run submitted: $data");
      return data;
    }
    throw Exception('Shuttle run failed (${response.statusCode}): ${response.body}');
  }

  /// Submit Endurance Run Result
  static Future<Map<String, dynamic>> submitEnduranceRunResult({
    required String userId,
    required double distanceMeters,
    required int timeSeconds,
    required DateTime date,
  }) async {
    final response = await http.post(
      _uri('/endurance-run'),
      headers: _headers(),
      body: jsonEncode({
        'userId': userId,
        'distance_m': distanceMeters,
        'time_s': timeSeconds,
        'date': date.toIso8601String(),
      }),
    );
    if (response.statusCode >= 200 && response.statusCode < 300) {
      final data = jsonDecode(response.body);
      print("✅ Endurance run submitted: $data");
      return data;
    }
    throw Exception('Endurance run failed (${response.statusCode}): ${response.body}');
  }

  /// Fetch Shuttle Run Results
  static Future<List<dynamic>> fetchShuttleRunResults({required String userId}) async {
    final response = await http.get(
      _uri('/shuttle-run?userId=$userId'),
      headers: _headers(),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print("📥 Shuttle run results: $data");
      if (data is List) return data;
      if (data is Map && data['items'] is List) return data['items'] as List<dynamic>;
      return [];
    }
    throw Exception('Fetch shuttle results failed (${response.statusCode})');
  }

  /// Fetch Endurance Run Results
  static Future<List<dynamic>> fetchEnduranceRunResults({required String userId}) async {
    final response = await http.get(
      _uri('/endurance-run?userId=$userId'),
      headers: _headers(),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print("📥 Endurance run results: $data");
      if (data is List) return data;
      if (data is Map && data['items'] is List) return data['items'] as List<dynamic>;
      return [];
    }
    throw Exception('Fetch endurance results failed (${response.statusCode})');
  }

// ---------------- PROFILE ----------------

  /// Get User Profile
  static Future<Map<String, dynamic>> getProfile({required String userId}) async {
    final response = await http.get(
      _uri('/users/$userId'),
      headers: _headers(),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print("📥 Profile fetched: $data");
      return data;
    }
    throw Exception('Profile fetch failed (${response.statusCode})');
  }

  /// Update User Profile
  static Future<Map<String, dynamic>> updateProfile({
    required String userId,
    String? name,
    String? password,
  }) async {
    final response = await http.put(
      _uri('/users/$userId'),
      headers: _headers(),
      body: jsonEncode({
        if (name != null) 'name': name,
        if (password != null) 'password': password,
      }),
    );
    if (response.statusCode >= 200 && response.statusCode < 300) {
      final data = jsonDecode(response.body);
      print("✅ Profile updated: $data");
      return data;
    }
    throw Exception('Profile update failed (${response.statusCode}): ${response.body}');
  }

  /// Store Test Data
  static Future<Map<String, dynamic>> storeTestData({
    required Map<String, dynamic> testData,
  }) async {
    final response = await http.post(
      _uri('/data/store'),
      headers: _headers(),
      body: jsonEncode(testData),
    );
    if (response.statusCode >= 200 && response.statusCode < 300) {
      final data = jsonDecode(response.body);
      print("✅ Test data stored: $data");
      return data;
    }
    throw Exception('Store test data failed (${response.statusCode}): ${response.body}');
  }
}
