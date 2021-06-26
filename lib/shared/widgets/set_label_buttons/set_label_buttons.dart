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
  final bool enableSecondaryColor;

  const SetLabelButtons({
    Key? key,
    required this.primaryLabel,
    required this.primaryOnPressed,
    required this.secondaryLabel,
    required this.secondaryOnPressed,
    this.enablePrimaryColor = false,
    this.enableSecondaryColor = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      height: 57,
      child: Column(
        children: [
          Divider(
            color: AppColors.stroke,
            thickness: 1,
            height: 1,
          ),
          Container(
            height: 56,
            child: Row(
              children: [
                LabelButton(
                  label: primaryLabel,
                  onPressed: primaryOnPressed,
                  style:
                      enablePrimaryColor ? AppTextStyles.buttonPrimary : null,
                ),
                VerticalDivider(
                  color: AppColors.stroke,
                  thickness: 1,
                  width: 1,
                ),
                LabelButton(
                  label: secondaryLabel,
                  onPressed: secondaryOnPressed,
                  style:
                      enableSecondaryColor ? AppTextStyles.buttonPrimary : null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
