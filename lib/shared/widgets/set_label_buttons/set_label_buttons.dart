import 'package:flutter/material.dart';

import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/label_button/label_button.dart';

class SetLabelButtons extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback primaryOnPressed;
  final String secondaryLabel;
  final VoidCallback secondaryOnPressed;
  final bool enablePrimaryColor;

  const SetLabelButtons({
    Key? key,
    required this.primaryLabel,
    required this.primaryOnPressed,
    required this.secondaryLabel,
    required this.secondaryOnPressed,
    this.enablePrimaryColor = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.shape,
      height: 56,
      child: Row(
        children: [
          LabelButton(
            label: primaryLabel,
            onPressed: primaryOnPressed,
            style: enablePrimaryColor ? AppTextStyles.buttonPrimary : null,
          ),
          VerticalDivider(
            width: 1,
            color: AppColors.stroke,
          ),
          LabelButton(
            label: secondaryLabel,
            onPressed: secondaryOnPressed,
          ),
        ],
      ),
    );
  }
}
