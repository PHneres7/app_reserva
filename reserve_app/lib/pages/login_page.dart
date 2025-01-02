import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:reserve_app/services/login_with_google_service.dart';
import 'package:sign_in_button/sign_in_button.dart';

import '../services/sign_in_service.dart';

import '../app/app_routs.dart';
import '../validator/email_validator.dart';
import '../validator/password_validator.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_divider.dart';
import '../widgets/custom_text_form_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                  'Olá, Bem-Vindo de Volta!!',
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
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomTextFormField(
                        label: 'Email',
                        controller: _emailController,
                        validator: EmailValidator(
                          "Email",
                        ).validate,
                      ),
                      CustomTextFormField(
                        label: 'Senha',
                        controller: _passwordController,
                        validator: PasswordValidator('Senha').validate,
                        isPasswordField: true,
                      ),
                      CustomButton(
                          label: 'Entrar',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              SignInService().signIn(
                                context,
                                _emailController.text,
                                _passwordController.text,
                              );
                            }
                          }),
                      SizedBox(
                        height: 40,
                      ),
                      CustomDivider(),
                      //BOTAO LOGIN COM GOOGLE
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: SignInButton(
                          onPressed: () async {
                            await _auth.LoginWithGoogle();
                          },
                          Buttons.google,
                          text: 'Login com Google',
                          padding: EdgeInsets.all(15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            side: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: 'Não possui uma conta?',
                            style: TextStyle(color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.of(context)
                                        .pushNamed(AppRouts.signUpPage);
                                  },
                                text: ' Registre-se',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
