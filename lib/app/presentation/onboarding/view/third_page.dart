import 'package:flutter/material.dart';
import 'package:moon_x/app/core/consturactor/const_image.dart';
import 'package:moon_x/app/core/consturactor/const_text.dart';
import 'package:moon_x/app/core/helper/screen_size.dart';
import 'package:moon_x/app/presentation/onboarding/widget/location_permission_box.dart';

class ThirdOnboardingPage extends StatelessWidget {
  const ThirdOnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            ImageEnum.onboardingthirdImage.imagePath,
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: ScreenSize.screenHeight * 0.361),
              ConstText.dashboardBoldTxt('Lorem Ipsum', context),
              SizedBox(height: ScreenSize.screenHeight * 0.03),
              ConstText.getDescriptionText(context),
              SizedBox(height: ScreenSize.screenHeight * 0.05),
              ConstText.dashboardBoldTxt('Enter Your Place Of Birth', context),
              SizedBox(height: ScreenSize.screenHeight * 0.03),
              const LocationPermissionBox(),
            ],
          )
        ],
      ),
    );
  }
}
