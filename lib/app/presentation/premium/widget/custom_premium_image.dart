import 'package:flutter/material.dart';
import 'package:moon_x/app/core/consturactor/const_image.dart';
import 'package:moon_x/app/core/helper/screen_size.dart';

class CustomPremiumImage extends StatelessWidget {
  const CustomPremiumImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          height: ScreenSize.screenHeight * 0.15,
          top: ScreenSize.screenHeight * 0.2,
          left: ScreenSize.screenWidth * -0.18,
          child: Image.asset(ImageEnum.premiumInApp1.imagePath),
        ),
        Positioned(
          height: ScreenSize.screenHeight * 0.2,
          top: ScreenSize.screenHeight * 0.17,
          left: ScreenSize.screenWidth * 0.25,
          child: Image.asset(ImageEnum.premiumInApp2.imagePath),
        ),
        Positioned(
            height: ScreenSize.screenHeight * 0.15,
            top: ScreenSize.screenHeight * 0.2,
            right: ScreenSize.screenWidth * -0.1,
            child: Image.asset(ImageEnum.premiumInApp3.imagePath)),
      ],
    );
  }
}
