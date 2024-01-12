import 'package:flutter/material.dart';
import 'package:moon_x/app/core/consturactor/const_image.dart';
import 'package:moon_x/app/core/helper/screen_size.dart';

class PremiumBlurEfect extends StatelessWidget {
  const PremiumBlurEfect({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          height: 300,
          top: ScreenSize.screenHeight * 0.04,
          left: ScreenSize.screenWidth * -0.2,
          child: Image.asset(
            ImageEnum.premiumBlur.imagePath,
          ),
        ),
        Positioned(
          height: 300,
          top: ScreenSize.screenHeight * 0.05,
          left: ScreenSize.screenWidth * 0.1,
          child: Image.asset(
            ImageEnum.premiumBlur.imagePath,
          ),
        ),
        Positioned(
          height: 300,
          top: ScreenSize.screenHeight * 0.12,
          left: ScreenSize.screenWidth * -0.25,
          child: Image.asset(
            ImageEnum.premiumBlur.imagePath,
          ),
        ),
        //
        Positioned(
          height: 300,
          top: ScreenSize.screenHeight * 0.05,
          right: ScreenSize.screenWidth * -0.25,
          child: Image.asset(
            ImageEnum.premiumBlur.imagePath,
          ),
        ),
        Positioned(
          height: 300,
          right: ScreenSize.screenWidth * -0.3,
          top: ScreenSize.screenHeight * 0.04,
          child: Image.asset(
            ImageEnum.premiumBlur.imagePath,
          ),
        ),
      ],
    );
  }
}
