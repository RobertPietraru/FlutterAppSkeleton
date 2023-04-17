import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../domain/entities/auth_failure.dart';

/// {@template Name}
/// Form input for an Name input.
/// {@endtemplate}
class Name extends FormzInput<String, AuthFailure> with EquatableMixin {
  /// {@macro Name}
  const Name.pure() : super.pure('');

  /// {@macro Name}
  const Name.dirty([super.value = '']) : super.dirty();

  @override
  AuthFailure? validator(String? value) {
    return (value ?? '').isEmpty ? AuthFailures.emptyName : null;
  }

  @override
  List<Object?> get props => [value, isValid, error];
}
