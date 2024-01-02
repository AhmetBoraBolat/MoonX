import 'package:flutter/material.dart';
import 'package:moon_x/app/components/consturactor/const_image.dart';
import 'package:moon_x/app/components/consturactor/const_text.dart';

class SecondDashboardPage extends StatelessWidget {
  const SecondDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            ImageEnum.secondImage.imagePath,
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 25),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ConstText.getDescriptionText(),
                  ConstText.dashboardBoldTxt('Enter Birth Date'),
                  Container(),
                  ConstText.dashboardBoldTxt('Enter Birth Time'),
                  const Text('Enter Birth Time'),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
