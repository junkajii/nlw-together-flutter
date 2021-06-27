import 'package:flutter/material.dart';

import 'package:payflow/modules/extract/extract_page.dart';
import 'package:payflow/modules/home/home_controller.dart';
import 'package:payflow/modules/login/login_controller.dart';
import 'package:payflow/modules/meus_boletos/meus_boletos_page.dart';
import 'package:payflow/shared/models/user_model.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HomePage extends StatefulWidget {
  final UserModel user;

  const HomePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  final controllerLogin = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(152),
        child: Container(
          height: 152,
          color: AppColors.primary,
          child: Center(
            child: ListTile(
              title: Text.rich(
                TextSpan(
                  text: 'Olá, ',
                  style: AppTextStyles.titleRegular,
                  children: [
                    TextSpan(
                      text: '${widget.user.name}',
                      style: AppTextStyles.titleBoldBackground,
                    ),
                  ],
                ),
              ),
              subtitle: Text(
                'Mantenha suas contas em dia',
                style: AppTextStyles.captionShape,
              ),
              trailing: GestureDetector(
                onTap: () {
                  Alert(
                    context: context,
                    type: AlertType.info,
                    image: Image.asset(AppImages.logomini),
                    title: "Já vai embora?",
                    desc: "Você deseja mesmo\ndeslogar da sua conta?",
                    buttons: [
                      DialogButton(
                        color: Colors.grey,
                        child: Text(
                          "SIgn Out",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () {
                          controllerLogin.signOut(context);
                        },
                        width: 120,
                      )
                    ],
                  ).show();
                },
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: NetworkImage(widget.user.photoURL!),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: [
        MeusBoletosPage(
          key: UniqueKey(),
        ),
        ExtractPage(
          key: UniqueKey(),
        ),
      ][controller.currentPage],
      bottomNavigationBar: Container(
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                controller.setPage(0);
                setState(() {});
              },
              color: controller.currentPage == 0
                  ? AppColors.primary
                  : AppColors.body,
              icon: Icon(
                Icons.home,
              ),
            ),
            GestureDetector(
              onTap: () async {
                await Navigator.pushNamed(context, '/barcode_scanner');
                // await Navigator.pushNamed(context, '/insert_boleto');
                setState(() {});
              },
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Icon(
                  Icons.add_box_outlined,
                  color: AppColors.background,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                controller.setPage(1);
                setState(() {});
              },
              color: controller.currentPage == 1
                  ? AppColors.primary
                  : AppColors.body,
              icon: Icon(
                Icons.description_outlined,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
