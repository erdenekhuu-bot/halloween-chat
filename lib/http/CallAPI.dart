import 'package:http/http.dart' as http;
import 'dart:convert';
import '../utils/Stack.dart';

class CallAPI {
  static Future<int> register(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.6.144:8000/api/signup/'),
        body: jsonEncode({
          "username": username,
          "password": password,
        }),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 201) {
        return 1;
      } else {
        return 0;
      }

    } catch (e) {
      print(e);
      return 0;
    }
  }

  static Future<int> login(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.6.144:8000/api/login/'),
        body: jsonEncode({
          "username": username,
          "password": password,
        }),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200) {
        StackMemory.setToken(jsonDecode(response.body)['token']);
        return 1;
      } else {
        return 0;
      }

    } catch (e) {
      print(e);
      return 0;
    }
  }

  static Future<List<dynamic>> listMember(String name, String token) async {
    try {
      final response = await http.get(
        Uri.parse('http://192.168.6.144:8000/api/list/?search=$name'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Token $token",
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  static Future<int> logout(String token) async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.6.144:8000/api/logout/'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Token $token",
        },
      );

      if (response.statusCode == 200) {
        return 1;
      } else {
        return 0;
      }

    } catch (e) {
      print(e);
      return 0;
    }
  }

}