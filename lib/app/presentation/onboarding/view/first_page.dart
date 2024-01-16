import 'package:flutter/material.dart';
import 'package:moon_x/app/core/constructor/const_image.dart';
import 'package:moon_x/app/core/constructor/const_text.dart';
import 'package:moon_x/app/core/helper/screen_size.dart';

class FirstOnboardingPage extends StatelessWidget {
  const FirstOnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            ImageEnum.onboardingfirstImage.imagePath,
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: ScreenSize.screenHeight * 0.5),
              Text('Welcome',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      )),
              SizedBox(height: ScreenSize.screenHeight * 0.03),
              ConstText.getDescriptionText(context),
              SizedBox(
                height: ScreenSize.screenHeight * 0.15,
              ),
            ],
          )
        ],
      ),
    );
  }
}
