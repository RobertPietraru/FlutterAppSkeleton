
import 'package:equatable/equatable.dart';

import '../../domain/entities/auth_failure.dart';
import 'package:formz/formz.dart';


class Password extends FormzInput<String, AuthFailure> with EquatableMixin {
  /// {@macro password}
  const Password.pure() : super.pure('');

  /// {@macro password}
  const Password.dirty([super.value = '']) : super.dirty();

  // static final _passwordRegExp =
  //     RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');

  @override
  AuthFailure? validator(String? value) {
    if ((value ?? '').isEmpty) {
      return AuthFailure.fromPasswordValidationError(
          message: 'The password cannot be empty');
    }
    return null;
    // return _passwordRegExp.hasMatch(value ?? '')
    //     ? null
    //     : PasswordValidationError.invalid;
  }

  @override
  List<Object?> get props => [value, isValid, error];
}
