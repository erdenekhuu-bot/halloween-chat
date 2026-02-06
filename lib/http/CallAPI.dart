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

}