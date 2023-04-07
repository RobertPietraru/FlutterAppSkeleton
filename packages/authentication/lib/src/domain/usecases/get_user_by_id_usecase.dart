import 'package:core/core.dart';

import '../auth_domain.dart';
import '../entities/auth_failure.dart';

class GetUserByIdUsecase extends UseCase<UserEntity, String> {
  const GetUserByIdUsecase(this.authRepository);
  final AuthRepository authRepository;

  @override
  Future<Either<AuthFailure, UserEntity>> call(params) async {
    return authRepository.getUserById(params);
  }
}
