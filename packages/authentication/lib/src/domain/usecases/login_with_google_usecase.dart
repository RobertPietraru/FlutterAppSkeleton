import 'package:core/core.dart';

import '../auth_domain.dart';
import '../entities/auth_failure.dart';

class LoginWithGoogleUsecase extends UseCase<UserEntity, NoParams> {
  LoginWithGoogleUsecase(this.authRepository);
  final AuthRepository authRepository;

  @override
  Future<Either<AuthFailure, UserEntity>> call(params) async {
    return authRepository.logInWithGoogle(params);
  }
}
