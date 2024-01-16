import 'package:flutter/material.dart';
import 'package:moon_x/app/core/constructor/const_text.dart';
import 'package:moon_x/app/core/helper/screen_size.dart';
import 'package:moon_x/app/presentation/home/settings/webview/webview.dart';

class SettingsListElements extends StatelessWidget {
  final String img;
  final String text;
  const SettingsListElements({
    super.key,
    required this.img,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // webwiew
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const WebviewPage()));
      },
      child: Padding(
        padding: EdgeInsets.only(top: ScreenSize.screenHeight * 0.01),
        child: Container(
          height: ScreenSize.screenHeight * 0.065,
          width: ScreenSize.screenWidth * 0.8,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(83, 95, 216, 0.21),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Row(
            children: [
              SizedBox(
                width: ScreenSize.screenWidth * 0.02,
              ),
              Image.asset(img),
              SizedBox(
                width: ScreenSize.screenWidth * 0.02,
              ),
              ConstText.dashboardBoldTxt(text, context),
            ],
          ),
        ),
      ),
    );
  }
}
