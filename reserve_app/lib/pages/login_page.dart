import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:reserve_app/app/app_routs.dart';
import 'package:reserve_app/validator/email_validator.dart';
import 'package:reserve_app/validator/phone_validator.dart';
import 'package:reserve_app/widgets/custom_button.dart';
import 'package:reserve_app/widgets/custom_divider.dart';
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
                  'Olá, bem vindo de volta!!',
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomTextFormField(
                        label: 'Email',
                        validator: EmailValidator("E-mail").validate,
                      ),
                      CustomTextFormField(
                        label: 'Password',
                        validator: PhoneValidator("phone").validate,
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
                        label: 'Login',
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      CustomDivider(),
                      CustomButton(
                        label: 'Login with Google',
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
                            children: <TextSpan>[
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.of(context)
                                        .pushNamed(AppRouts.SignUpPage);
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
