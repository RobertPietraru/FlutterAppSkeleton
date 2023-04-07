part of 'registration_cubit.dart';

enum RegistrationStatus { error, loading, successful, init }

class RegistrationState extends Equatable {
  const RegistrationState({
    required this.roles,
    required this.name,
    required this.email,
    required this.password,
    this.failure,
    this.status = RegistrationStatus.init,
  });

  final Email email;
  final Password password;
  final Name name;
  final RegistrationStatus status;
  final AuthFailure? failure;
  final Set<AccountType> roles;

  @override
  List<Object?> get props => [name, email, password, status, failure, ...roles];

  bool get isValid {
    return validationFailure == null;
  }

  bool get isSuccessful {
    return status == RegistrationStatus.successful;
  }

  String? get nameFailure {
    if (failure?.type == AuthFailureType.badName) {
      return failure?.message ?? failure?.code;
    }
    return null;
  }

  String? get emailFailure {
    if (failure?.type == AuthFailureType.badEmail) {
      return failure?.message ?? failure?.code;
    }
    return null;
  }

  String? get passwordFailure {
    if (failure?.type == AuthFailureType.badPassword) {
      return failure?.message ?? failure?.code;
    }
    return null;
  }

  bool get isInvalid {
    return !isValid;
  }

  AuthFailure? get validationFailure {
    return password.error ?? email.error ?? name.error;
  }

  RegistrationState copyWith({
    Name? name,
    Email? email,
    Password? password,
    RegistrationStatus? status,
    AuthFailure? failure = AuthFailure.mock,
    Set<AccountType>? roles,
  }) =>
      RegistrationState(
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        status: status ?? this.status,
        failure: failure == AuthFailure.mock ? this.failure : failure,
        roles: roles ?? this.roles,
      );
}
