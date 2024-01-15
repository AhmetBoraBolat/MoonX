import 'package:flutter/material.dart';
import 'package:moon_x/app/core/consturactor/const_image.dart';
import 'package:moon_x/app/core/consturactor/const_text.dart';
import 'package:moon_x/app/core/helper/screen_size.dart';
import 'package:moon_x/app/presentation/home/main/viewmodel/AI/main_page_ai_view_model.dart';
import 'package:moon_x/app/presentation/home/main/widget/category/category_box.dart';
import 'package:moon_x/app/presentation/home/main/widget/category/chatgpt_category_content_box.dart';
import 'package:moon_x/app/presentation/home/main/widget/chatgpt_content_box.dart';
import 'package:moon_x/app/presentation/home/main/widget/custom_main_card_design.dart';
import 'package:moon_x/app/presentation/home/main/widget/weather/custom_calendar_button.dart';
import 'package:moon_x/app/presentation/home/main/widget/weather/custom_weather_main_column.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainPageAIViewModel>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  ImageEnum.homeBackgroundImage.imagePath,
                  height: viewModel.isLoadingCategoryContent
                      ? ScreenSize.screenHeight * 1.51
                      : ScreenSize.screenHeight * 1.9,
                  fit: BoxFit.cover,
                ),
                const CustomCalendarButton(),
                const CustomMainWeatherColumn(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: ScreenSize.screenHeight * 0.51,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: ScreenSize.screenWidth * 0.06,
                      ),
                      child: ConstText.dashboardBoldTxt(
                          'What is for Today?', context),
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
                      child: ConstText.dashboardBoldTxt('Lunar Tips', context),
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
}
