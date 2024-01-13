import 'package:flutter/material.dart';
import 'package:moon_x/app/core/consturactor/const_image.dart';
import 'package:moon_x/app/core/consturactor/const_text.dart';
import 'package:moon_x/app/core/helper/screen_size.dart';
import 'package:moon_x/app/presentation/home/main/widget/category/category_box.dart';
import 'package:moon_x/app/presentation/home/main/widget/category/chatgpt_category_content_box.dart';
import 'package:moon_x/app/presentation/home/main/widget/chatgpt_content_box.dart';
import 'package:moon_x/app/presentation/home/main/widget/custom_main_card_design.dart';
import 'package:moon_x/app/presentation/home/main/widget/weather/custom_calendar_button.dart';
import 'package:moon_x/app/presentation/home/main/widget/weather/custom_weather_main_column.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                _backgroundImage(),
                const CustomCalendarButton(),
                const CustomMainWeatherColumn(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: ScreenSize.screenHeight * 0.47,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: ScreenSize.screenWidth * 0.06,
                      ),
                      child:
                          ConstText.dashboardBoldTxt('What is for Today?', 15),
                    ),
                    const MainCard(),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: ScreenSize.screenWidth * 0.06,
                        vertical: ScreenSize.screenHeight * 0.02,
                      ),
                      child: const ChatGptContentContainer(),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: ScreenSize.screenWidth * 0.05,
                        vertical: ScreenSize.screenHeight * 0.01,
                      ),
                      child: ConstText.dashboardBoldTxt('Lunar Tips', 16),
                    ),
                    const CustomCategoryBox(),
                    SizedBox(
                      height: ScreenSize.screenHeight * 0.04,
                    ),
                    const ChatGptCategoryContentContainer(),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Image _backgroundImage() {
    return Image.asset(
      ImageEnum.homeBackgroundImage.imagePath,
      height: ScreenSize.screenHeight * 1.8,
      fit: BoxFit.cover,
    );
  }
}
