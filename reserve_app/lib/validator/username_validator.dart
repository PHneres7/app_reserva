import 'package:reserve_app/validator/validator.dart';

class UsernameValidator extends Validator {
  UsernameValidator(
    super.fieldName, [
    super.message = 'Username inválido',
  ]);

  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName não pode estar vazio.';
    }

    if (value.length < 3) {
      return '$fieldName muito curto';
    }

    if (!value.contains(' ') || value.split(' ').length < 2) {
      return '$fieldName deve conter pelo menos um sobrenome.';
    }

    return null;
  }
}
