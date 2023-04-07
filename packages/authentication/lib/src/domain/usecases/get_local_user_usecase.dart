import 'package:core/core.dart';

import '../auth_domain.dart';
import '../entities/auth_failure.dart';

class GetLocalUserUsecase extends UseCase<UserEntity?, NoParams> {
  const GetLocalUserUsecase(this.authRepository);
  final AuthRepository authRepository;

  @override
  Future<Either<AuthFailure, UserEntity?>> call(NoParams params) {
    return authRepository.getLocalUser();
  }
}
