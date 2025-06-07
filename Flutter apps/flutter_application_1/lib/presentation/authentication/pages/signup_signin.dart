import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/helpers/is_dark.dart';
import 'package:flutter_application_1/common/widgets/appbar/appbar.dart';
import 'package:flutter_application_1/common/widgets/buttons/basic_app_button.dart';
import 'package:flutter_application_1/core/configs/assets/app_icons.dart';
import 'package:flutter_application_1/core/configs/assets/app_images.dart';
import 'package:flutter_application_1/core/configs/theme/app_colors.dart';
import 'package:flutter_application_1/presentation/authentication/pages/signin.dart';
import 'package:flutter_application_1/presentation/authentication/pages/signup.dart';
import 'package:flutter_svg/svg.dart';

class SignupSigninPage extends StatelessWidget {
  const SignupSigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BasicAppBar(),
          Align(alignment: Alignment.topRight, child: SvgPicture.asset(AppIcons.trPattern)),
          Align(alignment: Alignment.bottomRight, child: SvgPicture.asset(AppIcons.brPattern)),
          Align(alignment: Alignment.bottomLeft, child: Image.asset(AppImages.authImage)),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Align content to the center
                crossAxisAlignment: CrossAxisAlignment.center, // Align content to the center
                children: [
                  SvgPicture.asset(AppIcons.logo),
                  SizedBox(height: 55,),
                  const Text('EnjoyListening To Music', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  SizedBox(height: 21,),
                  Text('Spotify is a proprietary Swedish audio streaming and media service provider', style:TextStyle(fontWeight: FontWeight.w500, fontSize: 13, color: context.isDark ? AppColors.lightText : AppColors.darkText), textAlign: TextAlign.center,),
                  SizedBox(height: 30,),
                  Row(
                    children: [
                      //Expanded flex 1 means it will take 1/2 of the available space
                      Expanded( 
                        flex: 1,
                        child: BasicAppButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage()));
                        }, title: 'Register'),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        flex: 1,
                        child: TextButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SigninPage()));
                          },
                          child: Text('Sign in', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: context.isDark ? Colors.white : Colors.black)),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ),
        ],
      ),
    );
  }
}