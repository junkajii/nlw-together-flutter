import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:payflow/modules/insert_boleto/insert_boleto_controller.dart';

import 'package:payflow/shared/models/boleto_model.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class BoletoTileWidget extends StatelessWidget {
  InsertBoletoController get controller => InsertBoletoController();
  final BoletoModel data;
  const BoletoTileWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('TAP');
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return Container(
              height: 293,
              color: Colors.white,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text.rich(
                      TextSpan(
                        text: 'O boleto ',
                        style: AppTextStyles.trailingRegular,
                        children: [
                          TextSpan(
                            text: '${data.name}',
                            style: AppTextStyles.titleListTile,
                          ),
                          TextSpan(
                            text: '\nno valor de R\$ ',
                            style: AppTextStyles.trailingRegular,
                            children: [
                              TextSpan(
                                text: '${data.value!.toStringAsFixed(2)}',
                                style: AppTextStyles.titleListTile,
                              ),
                            ],
                          ),
                          TextSpan(
                            text: '\nfoi ',
                            style: AppTextStyles.trailingRegular,
                            children: [
                              TextSpan(
                                text: 'pago?',
                              ),
                            ],
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 155,
                            height: 55,
                            decoration: BoxDecoration(
                              color: AppColors.shape,
                              borderRadius: BorderRadius.circular(5),
                              border:
                                  Border.all(color: AppColors.stroke, width: 1),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Center(
                                child: Text(
                                  'Ainda não',
                                  style: TextStyle(color: AppColors.grey),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 16),
                          Container(
                            width: 155,
                            height: 55,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Center(
                                child: Text(
                                  'Sim',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Divider(
                      color: AppColors.stroke,
                      thickness: 1,
                      height: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.delete_outline_outlined,
                            color: Colors.red,
                          ),
                          Text(
                            'deletar boleto',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: AnimatedCard(
        direction: AnimatedCardDirection.bottom,
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            data.name!,
            style: AppTextStyles.titleListTile,
          ),
          subtitle: Text(
            'Vence em ${data.dueDate}',
            style: AppTextStyles.captionBody,
          ),
          trailing: Text.rich(
            TextSpan(
              text: "R\$ ",
              style: AppTextStyles.trailingRegular,
              children: [
                TextSpan(
                  text: "${data.value!.toStringAsFixed(2)}",
                  style: AppTextStyles.trailingBold,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
