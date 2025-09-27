import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:pulse/routes/app_routes.dart';
import 'package:pulse/services/auth_service.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  String userName = '';
  String userEmail = '';

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  /// Fetch the logged-in user's info from your backend
  Future<void> _loadUser() async {
    try {
      final profile = await AuthService.getProfile(); // ✅ Your backend call
      if (profile != null) {
        setState(() {
          userName = profile['name'] ?? '';
          userEmail = profile['email'] ?? '';
        });
      }
    } catch (e) {
      debugPrint('❌ Failed to load user profile: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          // Background gradient
          Container(
            decoration: BoxDecoration(color: Colors.lightBlue.withOpacity(0.1)),
          ),
          // Glassmorphic overlay
          ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
              child: Container(
                color: Colors.white.withOpacity(0.15),
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    const SizedBox(height: 50),
                    // Glass Profile Card
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.25),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: Colors.white.withOpacity(0.2), width: 1.5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 30,
                              backgroundImage:
                              AssetImage("assets/images/pfp.jpg"),
                            ),
                            const SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  userName.isNotEmpty ? userName : 'Sami',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  userEmail.isNotEmpty ? userEmail : '',
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    // Drawer Items
                    ListTile(
                      leading: const Icon(Icons.show_chart, color: Colors.white),
                      title:
                      const Text("Progress", style: TextStyle(color: Colors.white)),
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.progress);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.person, color: Colors.white),
                      title:
                      const Text("Profile", style: TextStyle(color: Colors.white)),
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.profile);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.sports, color: Colors.white),
                      title:
                      const Text("Standardized Test", style: TextStyle(color: Colors.white)),
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.dashboard);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.psychology, color: Colors.white),
                      title:
                      const Text("Psychological Tests", style: TextStyle(color: Colors.white)),
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.mentalTests);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.sports_football, color: Colors.white),
                      title:
                      const Text("Sports Specific Test", style: TextStyle(color: Colors.white)),
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.mentalTests);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.logout, color: Colors.white),
                      title:
                      const Text("Logout", style: TextStyle(color: Colors.white)),
                      onTap: () async {
                        await AuthService.logout(); // ✅ your backend logout
                        Navigator.pushNamedAndRemoveUntil(
                            context, AppRoutes.login, (route) => false);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
