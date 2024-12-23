import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:reserve_app/app/app_routs.dart';
import 'package:reserve_app/pages/sign_up_page.dart';
import 'package:reserve_app/widgets/custom_buttom.dart';
import 'package:reserve_app/widgets/custom_text_form_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //Texto 1 'Seja Bem Vindo'
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Olá, Bem vindo de volta!!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          ),

          // Parte 2 'Formulario'
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomTextFormField(label: 'Email'),
                  CustomTextFormField(label: 'Password'),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, right: 10),
                    child: Text(
                      'Esqueceu a senha?',
                      style: TextStyle(color: Colors.red),
                      textAlign: TextAlign.end,
                    ),
                  ),
                  CustomButtom(
                    label: 'Login',
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Divider(
                    color: Colors.black,
                    height: 0.5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Não possui uma conta?',
                        children: <TextSpan>[
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context)
                                    .pushNamed(AppRouts.SignUpPage);
                              },
                            text: ' Sign Up',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
