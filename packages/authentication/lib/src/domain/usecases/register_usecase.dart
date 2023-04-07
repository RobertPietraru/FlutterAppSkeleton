import 'package:core/core.dart';

import '../auth_domain.dart';
import '../entities/auth_failure.dart';

class RegisterUsecase extends UseCase<UserEntity, RegisterParams> {
  const RegisterUsecase(this.authRepository);

  final AuthRepository authRepository;

  @override
  Future<Either<AuthFailure, UserEntity>> call(params) async {
    return authRepository.registerUser(params);
  }
}

class RegisterParams {
  const RegisterParams(
      {required this.email,
      required this.password,
      required this.name,
      required this.roles});
  final String email;
  final String password;
  final String name;
  final Set<AccountType> roles;
}
