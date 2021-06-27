import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:payflow/modules/login/login_controller.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/social_login/social_login_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = LoginController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: size.width,
            height: 363,
            child: Stack(
              // alignment: Alignment.bottomCenter,
              children: [
                Positioned(
                  top: 0,
                  child: Container(
                    width: size.width,
                    height: size.height * 0.4,
                    color: AppColors.primary,
                  ),
                ),
                Positioned(
                  right: 90,
                  top: 130,
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: AppColors.grey,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Icon(
                      Icons.description_outlined,
                      color: AppColors.background,
                    ),
                  ),
                ),
                SafeArea(
                  child: Row(
                    children: [
                      Expanded(
                        child: Image.asset(
                          AppImages.person,
                          width: 158,
                          height: 323,
                        ),
                      ),
                    ],
                  ),
                ),
                SafeArea(
                  child: Container(
                    height: 323,
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.white,
                            Color(0x00FFFFFF),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 80,
                  bottom: 110,
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: AppColors.grey,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Icon(
                      Icons.add_box_outlined,
                      color: AppColors.background,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Image.asset(AppImages.logomini),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 250,
            child: Text(
              'Organize seus boletos em um só lugar',
              style: AppTextStyles.titleHome,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SocialLoginButton(
            onTap: () {
              controller.googleSignIn(context);
            },
          )
        ],
      ),
    );
  }
}
