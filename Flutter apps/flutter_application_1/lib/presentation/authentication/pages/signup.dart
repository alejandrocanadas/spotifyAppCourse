import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/appbar/appbar.dart';
import 'package:flutter_application_1/common/widgets/buttons/basic_app_button.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BasicAppBar(),
          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Text('Register', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                TextField(),
                TextField(),
                TextField(),
                BasicAppButton(
                  onPressed: (){}, 
                  title: 'Create Account'
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}