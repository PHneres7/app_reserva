import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:reserve_app/app/app_routs.dart';
import 'package:reserve_app/validator/email_validator.dart';
import 'package:reserve_app/validator/password_validator.dart';
import 'package:reserve_app/validator/phone_validator.dart';
import 'package:reserve_app/validator/username_validator.dart';
import 'package:reserve_app/widgets/custom_button.dart';
import 'package:reserve_app/widgets/custom_text_form_field.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  final _formKey = GlobalKey<FormState>();

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
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Crie Sua Conta!!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
                Text('Seu espaço na universidade, sempre ao seu alcance.'),
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
                        label: 'Nome de Usuário',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        fontSize: 12,
                        validator:
                            UsernameValidator('Nome de Usuário').validate,
                      ),
                      CustomTextFormField(
                        label: 'Email',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        fontSize: 12,
                        validator: EmailValidator('Email').validate,
                      ),
                      CustomTextFormField(
                        label: 'Número de Telefone',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        fontSize: 12,
                        validator: PhoneValidator('Número').validate,
                      ),
                      CustomTextFormField(
                        label: 'Senha',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        fontSize: 12,
                        validator: PasswordValidator('Senha').validate,
                      ),
                      CustomButton(
                        label: 'Criar Conta',
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.of(context).pushNamed(AppRouts.mainPage);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    'Por favor, corrija os erros no formulário.'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        },
                      ),
                      SizedBox(
                        height: 30,
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
                            text: 'Já possui uma conta?',
                            children: <TextSpan>[
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.of(context)
                                        .pushNamed(AppRouts.loginPage);
                                  },
                                text: ' Login',
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
