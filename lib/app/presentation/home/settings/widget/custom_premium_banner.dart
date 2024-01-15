import 'package:flutter/material.dart';
import 'package:moon_x/app/core/consturactor/const_image.dart';
import 'package:moon_x/app/core/consturactor/const_text.dart';
import 'package:moon_x/app/core/helper/screen_size.dart';
import 'package:moon_x/app/presentation/premium/view/premium_view.dart';

class CustomPremiumBanner extends StatelessWidget {
  const CustomPremiumBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const PremiumPage()));
        //premium ekranına yönelicek
      },
      child: Stack(
        children: [
          _backGroundBanner(),
          _frontBanner(context),
          _textBanner(context),
        ],
      ),
    );
  }

  Padding _textBanner(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: ScreenSize.screenHeight * 0.115,
          left: ScreenSize.screenWidth * 0.11),
      child: ConstText.dashboardBoldTxt(
          'Unlock package in order to access the features', context),
    );
  }

  Padding _frontBanner(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: ScreenSize.screenWidth * 0.2,
        top: ScreenSize.screenHeight * 0.03,
        left: ScreenSize.screenWidth * 0.1,
      ),
      child: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(11, 23, 148, 0.50),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Padding(
          padding: EdgeInsets.all(ScreenSize.screenWidth * 0.025),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ConstText.dashboardBoldTxt('Get Premium', context),
                  SizedBox(
                    width: ScreenSize.screenWidth * 0.04,
                  ),
                  Image.asset(
                    ImageEnum.settingsPremiumIconImage.imagePath,
                    scale: 2.5,
                  ),
                ],
              ),
              ConstText.dashboardBoldTxt('to Access All Contents!', context),
            ],
          ),
        ),
      ),
    );
  }

  Container _backGroundBanner() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: ScreenSize.screenWidth * 0.035),
      child: Image.asset(
        ImageEnum.settingsPremiumBannerImage.imagePath,
      ),
    );
  }
}
