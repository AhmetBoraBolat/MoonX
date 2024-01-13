import 'package:flutter/material.dart';
import 'package:moon_x/app/core/consturactor/const_image.dart';
import 'package:moon_x/app/core/consturactor/const_text.dart';
import 'package:moon_x/app/core/helper/screen_size.dart';
import 'package:moon_x/app/presentation/home/meditation/widget/custom_container_design.dart';

class MeditationFirstPage extends StatelessWidget {
  const MeditationFirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: ScreenSize.screenWidth * 0.08,
              bottom: ScreenSize.screenHeight * 0.02),
          child: ConstText.dashboardBoldTxt('Feng Shui', 18),
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
        Padding(
          padding: EdgeInsets.only(
              top: ScreenSize.screenHeight * 0.04,
              left: ScreenSize.screenWidth * 0.08,
              bottom: ScreenSize.screenHeight * 0.02),
          child: ConstText.dashboardBoldTxt('XYZ', 18),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomMeditationContainer(
                img: ImageEnum.meditationSmalWomenImage.imagePath,
                musicBigImg: ImageEnum.meditationWomenImage.imagePath),
            SizedBox(
              width: ScreenSize.screenWidth * 0.04,
            ),
            CustomMeditationContainer(
                img: ImageEnum.meditationSmalWomenImage.imagePath,
                musicBigImg: ImageEnum.meditationWomenImage.imagePath),
          ],
        ),
      ],
    );
  }
}
