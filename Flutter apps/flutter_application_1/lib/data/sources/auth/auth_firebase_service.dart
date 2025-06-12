import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/data/models/auth/create_user_req.dart';

abstract class AuthFirebaseService{
  Future<Either> signup(CreateUserReq createUserReq);
  Future<void> login();
}

class AuthFirebaseServiceImpl implements AuthFirebaseService{

  @override
  Future<Either> signup(CreateUserReq createUserReq) async{
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserReq.email, 
        password: createUserReq.password
      );

      return Right('Signup was successful');

    }on FirebaseAuthException catch(e){
      String message = '';

      if(e.code == 'weak-password'){
        message = 'The password provided is too weak.';
      } else if(e.code == 'email-already-in-use'){
        message = 'The account already exists for that email.';
      }

      return Left(message);
    }
  }

  @override
  Future<void> login() async{
    // TODO: implement login
    throw UnimplementedError();
  }
}