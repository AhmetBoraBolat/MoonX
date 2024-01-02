import 'package:flutter/material.dart';
import 'package:moon_x/app/components/consturactor/const_image.dart';
import 'package:moon_x/app/components/consturactor/const_text.dart';

class FirstDashboardPage extends StatelessWidget {
  const FirstDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            ImageEnum.firstImage.imagePath,
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                'Welcome',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              ConstText.getDescriptionText(),
              const SizedBox(
                height: 100,
              ),
            ],
          )
        ],
      ),
    );
  }
}
