import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:reserve_app/app/app_routs.dart';

class UserService {
  static const String baseUrl =
      'https://reserve-app-15815-default-rtdb.firebaseio.com';

  static Future<void> saveUser({
    required BuildContext context,
    required String username,
    required String email,
    required String phone,
    required String password,
  }) async {
    Map<String, String> user = {
      'username': username,
      'email': email,
      'phone': phone,
      'password': password,
    };

    try {
      final url = '$baseUrl/users.json';
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(user),
      );

      if (response.statusCode == 200) {
        
        if (context.mounted) {
          Navigator.of(context).pushNamed(AppRouts.mainPage);
        }
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content:
                    Text('Erro ao salvar o usuário: ${response.statusCode}')),
          );
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao salvar o usuário: $e')),
        );
      }
    }
  }
}
