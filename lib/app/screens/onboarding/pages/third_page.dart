import 'package:flutter/material.dart';
import 'package:moon_x/app/components/consturactor/const_image.dart';
import 'package:moon_x/app/components/consturactor/const_text.dart';
import 'package:moon_x/app/components/helper/screen_size.dart';
import 'package:moon_x/app/widgets/custom_date_picker.dart';

class ThirdDashboardPage extends StatefulWidget {
  const ThirdDashboardPage({super.key});

  @override
  State<ThirdDashboardPage> createState() => _ThirdDashboardPageState();
}

class _ThirdDashboardPageState extends State<ThirdDashboardPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ScreenSize.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            ImageEnum.thirdImage.imagePath,
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: ScreenSize.screenHeight * 0.361),
              ConstText.dashboardBoldTxt('Lorem Ipsum'),
              SizedBox(height: ScreenSize.screenHeight * 0.03),
              ConstText.getDescriptionText(),
              SizedBox(height: ScreenSize.screenHeight * 0.05),
              ConstText.dashboardBoldTxt('Enter Your Place Of Birth'),
              SizedBox(height: ScreenSize.screenHeight * 0.03),
              const DatePickerBox(),
            ],
          )
        ],
      ),
    );
  }
}
