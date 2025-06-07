import 'dart:ui';
import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/buttons/basic_app_button.dart';
import 'package:flutter_application_1/core/configs/assets/app_icons.dart';
import 'package:flutter_application_1/core/configs/assets/app_images.dart';
import 'package:flutter_application_1/presentation/authentication/pages/signup_signin.dart';
import 'package:flutter_application_1/presentation/choose_mode/bloc/theme_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ChooseModePage extends StatefulWidget {
  const ChooseModePage({super.key});

  @override
  State<ChooseModePage> createState() => _ChooseModePageState();
}

class _ChooseModePageState extends State<ChooseModePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        developer.log('Current theme mode: $themeMode');
        return Scaffold(
          body: Stack(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(AppImages.chooseModeBackground),
                  ),
                ),
              ),
              Container(color: Colors.black.withOpacity(0.15)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: SvgPicture.asset(AppIcons.logo),
                    ),
                    Spacer(),
                    Text(
                      'Choose Mode',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                developer.log('Dark mode selected');
                                context.read<ThemeCubit>().setTheme(ThemeMode.dark);
                              },
                              child: ClipOval(
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                  child: Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      color: themeMode == ThemeMode.dark
                                          ? Colors.white.withOpacity(0.3)
                                          : const Color(0xff30393C).withOpacity(0.5),
                                      shape: BoxShape.circle,
                                    ),
                                    child: SvgPicture.asset(
                                      AppIcons.moon,
                                      fit: BoxFit.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Dark Mode',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 20),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                developer.log('Light mode selected');
                                context.read<ThemeCubit>().setTheme(ThemeMode.light);
                              },
                              child: ClipOval(
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                  child: Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      color: themeMode == ThemeMode.light
                                          ? Colors.white.withOpacity(0.3)
                                          : const Color(0xff30393C).withOpacity(0.5),
                                      shape: BoxShape.circle,
                                    ),
                                    child: SvgPicture.asset(
                                      AppIcons.sun,
                                      fit: BoxFit.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Light Mode',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    BasicAppButton(
                      title: 'Continue',
                      height: 50,
                      onPressed: () {
                        developer.log('Continue button pressed');
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => const SignupSigninPage(),
                            ),
                            (route) => false,
                          );
                        });
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

