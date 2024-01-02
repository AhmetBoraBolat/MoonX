import 'package:flutter/material.dart';
import 'package:moon_x/app/components/consturactor/const_image.dart';
import 'package:moon_x/app/components/consturactor/const_text.dart';

class ThirdDashboardPage extends StatelessWidget {
  const ThirdDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            ImageEnum.thirdImage.imagePath,
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text('Lorem Ipsum'),
              ConstText.getDescriptionText(),
              const Text('Enter Your Place Of Birth'),
              const Text('Enter Your Place Of Birth'),
            ],
          )
        ],
      ),
    );
  }
}
