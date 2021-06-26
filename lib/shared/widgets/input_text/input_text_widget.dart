import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';

import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class InputTextWidget extends StatelessWidget {
  final String label;
  final IconData icon;
  final String? initialValue;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String value) onChanged;

  const InputTextWidget({
    Key? key,
    required this.label,
    required this.icon,
    this.initialValue,
    this.validator,
    this.controller,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      direction: AnimatedCardDirection.left,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Column(
          children: [
            TextFormField(
              initialValue: initialValue,
              validator: validator,
              controller: controller,
              onChanged: onChanged,
              style: AppTextStyles.input,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  border: InputBorder.none,
                  labelText: label,
                  labelStyle: AppTextStyles.input,
                  icon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        child: Icon(
                          icon,
                          color: AppColors.primary,
                        ),
                      ),
                      Container(
                        height: 48,
                        child: VerticalDivider(
                          color: AppColors.stroke,
                          thickness: 1,
                          width: 1,
                        ),
                      )
                    ],
                  )),
            ),
            Divider(
              color: AppColors.stroke,
              thickness: 1,
              height: 1,
            )
          ],
        ),
      ),
    );
  }
}
