part of 'login_cubit.dart';

enum LoginStatus { error, loading, successful, init }

class LoginState extends Equatable {
  const LoginState({
    required this.email,
    required this.password,
    this.failure,
    this.status = LoginStatus.init,
  });

  final Email email;
  final Password password;
  final LoginStatus status;
  final AuthFailure? failure;

  @override
  List<Object?> get props => [email, password, status, failure];

  bool get isLoading {
    return status == LoginStatus.loading;
    
  }

  bool get isValid {
    return validationFailure == null;
  }

  String? get emailFailure {
    if (failure?.type == AuthFailureType.badEmail ||
        failure?.type == AuthFailureType.badInput) {
      return failure?.message ?? failure?.code;
    }
    return null;
  }

  String? get passwordFailure {
    if (failure?.type == AuthFailureType.badPassword ||
        failure?.type == AuthFailureType.badInput) {
      return failure?.message ?? failure?.code;
    }
    return null;
  }

  bool get isInvalid {
    return !isValid;
  }

  AuthFailure? get validationFailure {
    final emailValidationError = email.error;
    final passwordValidationError = password.error;
    return emailValidationError ?? passwordValidationError;
  }

  LoginState copyWith({
    Email? email,
    Password? password,
    LoginStatus? status,
    AuthFailure? failure = AuthFailure.mock,
  }) =>
      LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        status: status ?? this.status,
        failure: failure == AuthFailure.mock ? this.failure : failure,
      );
}
