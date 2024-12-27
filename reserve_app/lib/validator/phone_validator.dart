import 'validator.dart';

class PhoneValidator extends Validator {
  PhoneValidator(super.fieldName, [super.message = 'telefone inválido']);

  @override
  String? validate(String? value) {
    if (value != null) {
      final cleanedValue = value.replaceAll(RegExp(r'\D'), '');
      if (cleanedValue.length < 10) {
        return '$fieldName deve conter pelo menos 10 dígitos.';
      } else if (cleanedValue.length > 11) {
        return '$fieldName não pode ter mais de 11 dígitos.';
      } else if (cleanedValue.length != 10 && cleanedValue.length != 11) {
        return '$fieldName deve ter 10 ou 11 dígitos.';
      }
    }
    return null;
  }
}
