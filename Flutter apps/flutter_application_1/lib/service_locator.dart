import 'package:flutter_application_1/data/repository/auth/auth_repository_impl.dart';
import 'package:flutter_application_1/data/sources/auth/auth_firebase_service.dart';
import 'package:flutter_application_1/domain/repository/auth/auth.dart';
import 'package:flutter_application_1/domain/usecases/auth/signup_usecase.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async{
  sl.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl()
  );

  sl.registerSingleton<AuthRepository>(
    AuthRepositoryImpl()
  );

  sl.registerSingleton<SignupUsecase>(
    SignupUsecase()
  );
}
