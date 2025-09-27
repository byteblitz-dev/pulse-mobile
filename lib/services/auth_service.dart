import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import './api_service.dart';

class AuthService {
  // ---------------------------
  // Internal storage
  // ---------------------------
  static String? _token;
  static String? _userId;
  static String? _name;
  static String? _email;

  // Keys for SharedPreferences
  static const String _kToken = 'auth_token';
  static const String _kUserId = 'user_id';
  static const String _kName = 'user_name';
  static const String _kEmail = 'user_email';

  // ---------------------------
  // REGISTER ATHLETE
  // ---------------------------
  static Future<Map<String, dynamic>> registerAthlete({
    required String name,
    required String email,
    required String password,
    int? age,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('${ApiConfig.baseUrl}/auth/athlete/signup'),
        headers: ApiConfig.headers,
        body: jsonEncode({
          'name': name,
          'email': email,
          'password': password,
          if (age != null) 'age': age,
        }),
      );

      final dataRaw = jsonDecode(response.body);
      final data = Map<String, dynamic>.from(dataRaw);

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("✅ Registration success: $data");
        return {'success': true, 'data': data};
      } else {
        print("❌ Registration failed: ${response.statusCode} → $data");
        return {
          'success': false,
          'message': data['message'] ?? 'Registration failed',
        };
      }
    } catch (e) {
      print("⚠️ Registration error: $e");
      return {'success': false, 'message': e.toString()};
    }
  }

  // ---------------------------
  // LOGIN ATHLETE
  // ---------------------------
  static Future<Map<String, dynamic>> loginAthlete({
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('${ApiConfig.baseUrl}/auth/athlete/signin'),
        headers: ApiConfig.headers,
        body: jsonEncode({'email': email, 'password': password}),
      );

      final dataRaw = jsonDecode(response.body);
      final data = Map<String, dynamic>.from(dataRaw);

      if (response.statusCode == 200) {
        final user = Map<String, dynamic>.from(data['user'] ?? {});
        _token = data['token']?.toString();
        _userId = user['id']?.toString();
        _name = user['name']?.toString();
        _email = user['email']?.toString() ?? email;

        await _persistAuthState();

        print("✅ Login success: token=$_token, userId=$_userId, name=$_name");
        return {'success': true, 'data': data};
      } else {
        print("❌ Login failed: ${response.statusCode} → $data");
        return {
          'success': false,
          'message': data['message'] ?? 'Login failed',
        };
      }
    } catch (e) {
      print("⚠️ Login error: $e");
      return {'success': false, 'message': e.toString()};
    }
  }

  // ---------------------------
  // PERSIST AUTH STATE
  // ---------------------------
  static Future<void> _persistAuthState() async {
    final prefs = await SharedPreferences.getInstance();
    if (_token != null) await prefs.setString(_kToken, _token!);
    if (_userId != null) await prefs.setString(_kUserId, _userId!);
    if (_name != null) await prefs.setString(_kName, _name!);
    if (_email != null) await prefs.setString(_kEmail, _email!);
  }

  // ---------------------------
  // LOAD AUTH STATE
  // ---------------------------
  static Future<bool> loadAuthState() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      _token = prefs.getString(_kToken);
      _userId = prefs.getString(_kUserId);
      _name = prefs.getString(_kName);
      _email = prefs.getString(_kEmail);

      return _token != null && _userId != null;
    } catch (_) {
      return false;
    }
  }

  // ---------------------------
  // LOGOUT
  // ---------------------------
  static Future<void> clearAuthState() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_kToken);
    await prefs.remove(_kUserId);
    await prefs.remove(_kName);
    await prefs.remove(_kEmail);

    _token = null;
    _userId = null;
    _name = null;
    _email = null;
  }

  // ---------------------------
  // GET PROFILE
  // ---------------------------
  static Future<Map<String, dynamic>?> getProfile() async {
    if (_token == null) {
      print("⚠️ No token found, user not logged in.");
      return null;
    }

    try {
      final response = await http.get(
        Uri.parse('${ApiConfig.baseUrl}/auth/athlete/profile'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_token',
        },
      );

      if (response.statusCode == 200) {
        final dataRaw = jsonDecode(response.body);

        // Ensure the decoded response is a Map<String, dynamic>
        if (dataRaw is Map) {
          return Map<String, dynamic>.from(dataRaw);
        } else {
          print("❌ Unexpected profile format: $dataRaw");
          return null;
        }
      } else {
        print("❌ Failed to fetch profile: ${response.statusCode} → ${response.body}");
        return null;
      }
    } catch (e) {
      print("⚠️ Error fetching profile: $e");
      return null;
    }
  }



  // ---------------------------
  // LOGOUT FUNCTION
  // ---------------------------
  static Future<void> logout() async {
    if (_token != null) {
      try {
        await http.post(
          Uri.parse('${ApiConfig.baseUrl}/logout'),
          headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $_token'},
        );
      } catch (_) {
        // Ignore backend errors
      }
    }
    await clearAuthState();
  }

  // ---------------------------
  // GETTERS
  // ---------------------------
  static String? get token => _token;
  static String? get userId => _userId;
  static String? get name => _name;
  static String? get email => _email;

  // ---------------------------
  // AUTH HEADERS
  // ---------------------------
  static Map<String, String> getAuthHeaders() {
    return {
      ...ApiConfig.headers,
      if (_token != null) 'Authorization': 'Bearer $_token',
    };
  }
}
