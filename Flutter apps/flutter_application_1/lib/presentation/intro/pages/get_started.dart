import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/buttons/basic_app_button.dart';
import 'package:flutter_application_1/core/configs/assets/app_icons.dart';
import 'package:flutter_application_1/core/configs/assets/app_images.dart';
import 'package:flutter_application_1/core/configs/theme/app_colors.dart';
import 'package:flutter_application_1/presentation/choose_mode/pages/choose_mode.dart';
import 'package:flutter_svg/svg.dart';

class getStartedPage extends StatelessWidget {
  const getStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[
          Container(
            padding: EdgeInsets.symmetric(vertical: 40, horizontal: 40),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(AppImages.introBackground)
              )
            ),
          ),

          Container(color: Colors.black.withOpacity(0.15)),

          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 40,
              horizontal: 40
            ),
            child: Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: SvgPicture.asset(AppIcons.logo),
                  ),
                  Spacer(),
                  Text('EnjoyListening To Music',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18
                    )
                  ),
                  const SizedBox(height: 21),
                  Text('Discover new music, create playlists, and enjoy your favorite songs with our app.',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: AppColors.lightText,
                      fontSize: 13
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 50),
                  BasicAppButton(title: 'Get Started', height: 50, onPressed: (){
                    // Navigate to the Choose Mode Page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const ChooseModePage()
                      ),
                    );
                  }),
                ],
              ),
          ),
        ]
      )
    );
  }
}