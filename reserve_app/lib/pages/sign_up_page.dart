import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import '../services/firebase_service_auth.dart';
import '../services/sign_up_service.dart';

import '../widgets/custom_text_form_field.dart';
import '../widgets/custom_button.dart';
import '../app/app_routs.dart';

import '../validator/email_validator.dart';
import '../validator/password_validator.dart';
import '../validator/phone_validator.dart';
import '../validator/username_validator.dart';

//DESSA FORMA OS DADOS DE CADASTRO FICAM NO REALTIME DATABASE

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  final FirebaseServiceAuth _auth = FirebaseServiceAuth();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
                      //NOME DE USUARIO
                      CustomTextFormField(
                        label: 'Nome de Usuário',
                        controller: _usernameController,
                        validator:
                            UsernameValidator('Nome de Usuário').validate,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        fontSize: 12,
                      ),
                      //EMAIL
                      CustomTextFormField(
                        label: 'Email',
                        controller: _emailController,
                        validator: EmailValidator('Email').validate,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        fontSize: 12,
                      ),
                      //NUMERO DE TELEFONE
                      CustomTextFormField(
                        label: 'Número de Telefone',
                        controller: _phoneController,
                        validator: PhoneValidator('Número').validate,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        fontSize: 12,
                      ),
                      //SENHA
                      CustomTextFormField(
                        label: 'Senha',
                        controller: _passwordController,
                        validator: PasswordValidator('Senha').validate,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        isPasswordField: true,
                        fontSize: 12,
                      ),
                      CustomButton(
                        label: 'Criar Conta',
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            SignUpService().signUp(
                              context: context,
                              formKey: _formKey,
                              emailController: _emailController,
                              passwordController: _passwordController,
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
