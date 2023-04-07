import 'package:authentication/authentication.dart';
import 'package:core/core.dart';

/// {@template email}
/// Form input for an email input.
/// {@endtemplate}
class Email extends FormzInput<String, AuthFailure> with EquatableMixin {
  /// {@macro email}
  const Email.pure() : super.pure('');

  /// {@macro email}
  const Email.dirty([super.value = '']) : super.dirty();

  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  @override
  AuthFailure? validator(String? value) {
    if ((value ?? '').isEmpty) {
      return AuthFailure.fromEmailValidationError(
          message: 'Email cannot be empty');
    }
    return _emailRegExp.hasMatch(value ?? '')
        ? null
        : AuthFailure.fromEmailValidationError(
            message: 'The email you provided is invalid');
  }

  @override
  List<Object?> get props => [value, isValid, error];
}
