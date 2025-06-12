import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/appbar/appbar.dart';
import 'package:flutter_application_1/common/widgets/buttons/basic_app_button.dart';
import 'package:flutter_application_1/core/configs/assets/app_icons.dart';
import 'package:flutter_application_1/data/models/auth/create_user_req.dart';
import 'package:flutter_application_1/domain/usecases/auth/signup_usecase.dart';
import 'package:flutter_application_1/presentation/authentication/pages/signin.dart';
import 'package:flutter_application_1/presentation/root/pages/root.dart';
import 'package:flutter_application_1/service_locator.dart';
import 'package:flutter_svg/svg.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _signinText(context),
      appBar: BasicAppBar(
        title: SvgPicture.asset(AppIcons.logo,
          height: 40,
          width: 40,
        ),
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 40, 
                horizontal: 40
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _registerText(),
                  SizedBox(height: 50,),
                  _fullNameField(context),
                  SizedBox(height: 20,),
                  _emailField(context),
                  SizedBox(height: 20,),
                  _passwordField(context),
                  SizedBox(height: 20,),
                  BasicAppButton(
                    onPressed: () async {
                      var result = await sl<SignupUsecase>().call(
                        params: CreateUserReq(name: _name.text.toString(), email: _email.text.toString(), password: _password.text.toString())
                      );

                      result.fold(
                        (l){
                          var snackBar = SnackBar(content: Text(l));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }, 
                        (r){
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => const RootPage()), (route) => false);
                        }
                      );
                    }, 
                    title: 'Create Account'
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }


  Widget _registerText(){
    return const Text(
      'Register',
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold
      ),
    );
  }

  Widget _fullNameField(context){
    return TextField(
      controller: _name,
      decoration: InputDecoration(
        hintText: 'Full Name',
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme
      ),
    );
  }

  Widget _emailField(context){
    return TextField(
      controller: _email,
      decoration: InputDecoration(
        hintText: 'Enter Email',
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme
      ),
    );
  }

  Widget _passwordField(context){
    return TextField(
      controller: _password,
      decoration: InputDecoration(
        hintText: 'Enter Email',
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme
      ),
    );
  }

  Widget _signinText(BuildContext context){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Do you Already Have an Account?',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 13
            ),
          ),
          TextButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => SigninPage()));
            }, 
            child: Text(
              'Sign In',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13
              ),
            )
          )
        ],
      ),
    );
  }
}