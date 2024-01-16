import 'package:flutter/material.dart';
import 'package:moon_x/app/core/constructor/const_image.dart';
import 'package:moon_x/app/core/constructor/const_text.dart';
import 'package:moon_x/app/core/helper/screen_size.dart';
import 'package:moon_x/app/presentation/home/meditation/widget/custom_container_design.dart';

class MeditationThirdPage extends StatelessWidget {
  const MeditationThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: ScreenSize.screenWidth * 0.08,
              bottom: ScreenSize.screenHeight * 0.02),
          child: ConstText.dashboardBoldTxt('Mantras', context),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomMeditationContainer(
                img: ImageEnum.meditationBlueMusicImage.imagePath,
                musicBigImg: null),
            SizedBox(
              width: ScreenSize.screenWidth * 0.04,
            ),
            CustomMeditationContainer(
              img: ImageEnum.meditationPurpleImage.imagePath,
              musicBigImg: null,
            ),
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomMeditationContainer(
                img: ImageEnum.meditationRedImage.imagePath, musicBigImg: null),
            SizedBox(
              width: ScreenSize.screenWidth * 0.04,
            ),
            CustomMeditationContainer(
                img: ImageEnum.meditationGreenMusicImage.imagePath,
                musicBigImg: null),
          ],
        ),
      ],
    );
  }
}
