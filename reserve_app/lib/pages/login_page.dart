import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:reserve_app/app/app_routs.dart';
import 'package:reserve_app/validator/email_validator.dart';
import 'package:reserve_app/validator/password_validator.dart';
import 'package:reserve_app/widgets/custom_button.dart';
import '../widgets/custom_divider.dart';
import '../widgets/custom_text_form_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> loginTeste = {
    'emailteste@gmail.com': 'Senha1234',
    'email2teste@gmail.com': 'Senha4321',
  };
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
                      Padding(
                        padding: const EdgeInsets.only(top: 5, right: 10),
                        child: Text(
                          'Esqueceu a senha?',
                          style: TextStyle(color: Colors.red),
                          textAlign: TextAlign.end,
                        ),
                      ),
                      CustomButton(
                        label: 'Entrar',
                        onPressed: () {
                          String email = _emailController.text;
                          String password = _passwordController.text;

                          if (_formKey.currentState!.validate() &&
                              loginTeste[email] == password) {
                            Navigator.of(context).pushNamed(AppRouts.mainPage);
                            return;
                          }
                          if (_formKey.currentState!.validate() &&
                              loginTeste.containsKey(email) &&
                              loginTeste[email] != password) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Senha incorreta'),
                                backgroundColor: Colors.red,
                              ),
                            );
                            return;
                          }
                          if (!_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Email ou senha inválidos'),
                                backgroundColor: Colors.red,
                              ),
                            );
                            return;
                          }

                          if (_formKey.currentState!.validate() &&
                              loginTeste[email] != password) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Conta não existente'),
                                backgroundColor: Colors.red,
                              ),
                            );
                            return;
                          }
                        },
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      CustomDivider(),
                      CustomButton(
                        label: 'Login com Google',
                        onPressed: () {},
                        labelColor: Colors.grey.shade700,
                        backgroundColor: Colors.white,
                        imageIcon: 'asset/GoogleLogo.png',
                        borderColor: Colors.grey,
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
