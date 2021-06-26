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
        children: [
          Container(
            width: size.width,
            height: 363,
            child: Stack(
              children: [
                Container(
                  width: size.width,
                  height: size.height * 0.4,
                  color: AppColors.primary,
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
              ],
            ),
          ),
          // SizedBox(
          //   height: 24,
          // ),
          Image.asset(AppImages.logomini),
          SizedBox(
            height: 24,
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
            height: 40,
          ),
          SocialLoginButton(
            onTap: () {
              controller.googleSignIn(context);
            },
          ),
        ],
      ),
    );
  }
}
