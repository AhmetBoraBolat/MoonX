import 'package:flutter/material.dart';
import 'package:moon_x/app/core/constructor/const_image.dart';
import 'package:moon_x/app/core/constructor/const_text.dart';
import 'package:moon_x/app/core/helper/screen_size.dart';
import 'package:moon_x/app/presentation/home/meditation/widget/custom_container_design.dart';

class MeditationSecondPage extends StatelessWidget {
  const MeditationSecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: ScreenSize.screenWidth * 0.08,
              bottom: ScreenSize.screenHeight * 0.02),
          child: ConstText.dashboardBoldTxt('Yoga', context),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomMeditationContainer(
                img: ImageEnum.meditationSmalImage.imagePath,
                musicBigImg: ImageEnum.meditationImage.imagePath),
            SizedBox(
              width: ScreenSize.screenWidth * 0.04,
            ),
            CustomMeditationContainer(
                img: ImageEnum.meditationSmalImage.imagePath,
                musicBigImg: ImageEnum.meditationImage.imagePath),
          ],
        ),
      ],
    );
  }
}
