import 'package:flutter/material.dart';
import 'package:moon_x/app/core/consturactor/const_image.dart';
import 'package:moon_x/app/core/consturactor/const_text.dart';
import 'package:moon_x/app/core/helper/screen_size.dart';

class FirstOnboardingPage extends StatefulWidget {
  const FirstOnboardingPage({super.key});

  @override
  State<FirstOnboardingPage> createState() => _FirstOnboardingPageState();
}

class _FirstOnboardingPageState extends State<FirstOnboardingPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ScreenSize.init(context);
  }

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
              const Text(
                'Welcome',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: ScreenSize.screenHeight * 0.03),
              ConstText.getDescriptionText(),
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
