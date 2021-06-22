import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class SocialLoginButton extends StatelessWidget {
  final VoidCallback onTap;

  const SocialLoginButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 56,
        width: 295,
        decoration: BoxDecoration(
          color: AppColors.shape,
          border: Border.fromBorderSide(
            BorderSide(color: AppColors.stroke),
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              AppImages.google,
              width: 56,
              height: 56,
            ),
            VerticalDivider(
              width: 1.0,
              color: AppColors.stroke,
            ),
            Expanded(
              child: Text(
                'Entrar com Google',
                style: AppTextStyles.buttonGray,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
