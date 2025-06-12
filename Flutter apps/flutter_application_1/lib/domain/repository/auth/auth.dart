import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/data/models/auth/create_user_req.dart';

abstract class AuthRepository{
  
  Future<Either> signup(CreateUserReq createUserReq);

  Future<void> login();
}