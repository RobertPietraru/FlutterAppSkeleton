import 'package:core/core.dart';

import '../auth_domain.dart';
import '../entities/auth_failure.dart';

class LogoutUsecase extends UseCase<void, NoParams> {
  const LogoutUsecase(this.authRepository);
  final AuthRepository authRepository;

  @override
  Future<Either<AuthFailure, void>> call(params) async {
    return authRepository.logUserOut();
  }
}
