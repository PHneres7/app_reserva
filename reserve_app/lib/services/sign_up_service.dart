import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:reserve_app/services/firebase_service_auth.dart';
import 'package:reserve_app/app/app_routs.dart';

class   SignUpService {
  final FirebaseServiceAuth _auth = FirebaseServiceAuth();

  Future<void> signUp({
    required BuildContext context,
    required GlobalKey<FormState> formKey,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  }) async {
    String email = emailController.text;
    String password = passwordController.text;

    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.of(context).pushNamed(AppRouts.loginPage);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('A conta já existe para esse e-mail.'),
            backgroundColor: Colors.red,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Por favor, corrija os erros no formulário.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }
}
