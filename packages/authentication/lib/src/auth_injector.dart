import 'package:authentication/src/data/repositories/auth_repository_impl.dart';
import 'package:authentication/src/domain/auth_domain.dart';
import 'package:core/core.dart';
import 'data/datasource/auth_remote_data_source.dart';

void authInject() {
  locator
    ..registerSingleton<AuthRemoteDataSource>(AuthFirebaseDataSourceIMPL())
    ..registerSingleton<AuthRepository>(AuthRepositoryIMPL(locator()))
    ..registerSingleton<GetLocalUserUsecase>(GetLocalUserUsecase(locator()))
    ..registerSingleton(LoginUsecase(locator()))
    ..registerSingleton(LogoutUsecase(locator()))
    ..registerSingleton(RegisterUsecase(locator()))
    ..registerSingleton(LoginWithGoogleUsecase(locator()))
    ..registerSingleton(GetUserByIdUsecase(locator()));
}
