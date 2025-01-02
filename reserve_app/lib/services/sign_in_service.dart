import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../services/firebase_service_auth.dart';
import '../app/app_routs.dart';

class SignInService {
  final FirebaseServiceAuth _authService = FirebaseServiceAuth();

  Future<void> signIn(
      BuildContext context, String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, preencha todos os campos.')),
      );
      return;
    }

    try {
      User? user = await _authService.signInWithEmailAndPassword(
        email,
        password,
      );

      if (user != null) {
        Navigator.of(context).pushReplacementNamed(AppRouts.mainPage);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Falha ao fazer login. Verifique suas credenciais.'),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao fazer login: $e')),
      );
    }
  }
}
