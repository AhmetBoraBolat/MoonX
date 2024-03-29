import 'package:flutter/material.dart';
import 'package:moon_x/app/core/constructor/const_image.dart';
import 'package:moon_x/app/core/constructor/const_text.dart';
import 'package:moon_x/app/core/helper/screen_size.dart';
import 'package:moon_x/app/presentation/onboarding/widget/custom_date_picker.dart';
import 'package:moon_x/app/presentation/onboarding/widget/custom_time_picker.dart';

class SecondOnboardingPage extends StatelessWidget {
  const SecondOnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            ImageEnum.onboardingsecondImage.imagePath,
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: ScreenSize.screenHeight * 0.34),
              ConstText.getDescriptionText(context),
              _secondPageColumn(context),
            ],
          )
        ],
      ),
    );
  }

  Column _secondPageColumn(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ConstText.dashboardBoldTxt('Enter Birth Date', context),
        SizedBox(height: ScreenSize.screenHeight * 0.02),
        const DatePickerBox(),
        SizedBox(height: ScreenSize.screenHeight * 0.03),
        ConstText.dashboardBoldTxt('Enter Birth Time', context),
        SizedBox(height: ScreenSize.screenHeight * 0.02),
        const TimePickerBox(),
      ],
    );
  }
}
