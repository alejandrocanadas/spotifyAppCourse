import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/configs/usecase.dart';
import 'package:flutter_application_1/data/models/auth/create_user_req.dart';
import 'package:flutter_application_1/domain/repository/auth/auth.dart';
import 'package:flutter_application_1/service_locator.dart';

class SignupUsecase implements Usecase<Either, CreateUserReq>{
  @override
  Future<Either> call({CreateUserReq ? params}) async{
   return sl<AuthRepository>().signup(params!);
  }

}
