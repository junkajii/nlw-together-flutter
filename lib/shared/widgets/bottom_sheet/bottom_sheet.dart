import 'package:flutter/material.dart';
import 'package:payflow/modules/barcode_scanner/barcode_scanner_controller.dart';

import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/set_label_buttons/set_label_buttons.dart';

class BottomSheetWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final BarcodeScannerController controller;

  const BottomSheetWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RotatedBox(
        quarterTurns: 1,
        child: Material(
          child: Container(
            color: AppColors.shape,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
                SizedBox(height: 40),
                Text(
                  title,
                  style: AppTextStyles.buttonBoldHeading,
                ),
                Text(
                  subtitle,
                  style: AppTextStyles.buttonHeading,
                ),
                SizedBox(height: 40),
                Divider(
                  color: AppColors.stroke,
                  height: 1,
                ),
                SetLabelButtons(
                  enablePrimaryColor: true,
                  primaryLabel: 'Escanear novamente',
                  primaryOnPressed: () {
                    print('pressed again');
                    controller.getAvailableCameras();
                  },
                  secondaryLabel: 'Digitar código',
                  secondaryOnPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
