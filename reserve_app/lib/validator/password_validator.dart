import 'package:reserve_app/validator/validator.dart';

class PasswordValidator extends Validator {
  PasswordValidator(
    super.fieldName, [
    super.message = 'Senha inválida',
  ]);

  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName não pode estar vazio.';
    }

    if (value.length < 6) {
      return '$fieldName deve ter pelo menos 6 caracteres.';
    }

    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return '$fieldName deve conter pelo menos uma letra maiúscula.';
    }

    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return '$fieldName deve conter pelo menos um número.';
    }

    return null;
  }
}
