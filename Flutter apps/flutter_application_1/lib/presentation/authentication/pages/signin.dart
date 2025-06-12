import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/appbar/appbar.dart';
import 'package:flutter_application_1/common/widgets/buttons/basic_app_button.dart';
import 'package:flutter_application_1/core/configs/assets/app_icons.dart';
import 'package:flutter_application_1/presentation/authentication/pages/signup.dart';
import 'package:flutter_svg/svg.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _signupText(context),
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
                  _userNameEmailField(context),
                  SizedBox(height: 20,),
                  _passwordField(context),
                  SizedBox(height: 20,),
                  BasicAppButton(
                    onPressed: (){}, 
                    title: 'Sign In'
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
      'Sign In',
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold
      ),
    );
  }

  Widget _userNameEmailField(context){
    return TextField(
      decoration: InputDecoration(
        hintText: 'Enter Username Or Email',
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme
      ),
    );
  }

  Widget _passwordField(context){
    return TextField(
      decoration: InputDecoration(
        hintText: 'Enter Email',
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme
      ),
    );
  }

  Widget _signupText(BuildContext context){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Not A Member ?',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 13
            ),
          ),
          TextButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage()));
            }, 
            child: Text(
              'Register Now',
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