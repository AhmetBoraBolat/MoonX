import 'package:flutter/material.dart';
import 'package:moon_x/app/components/consturactor/const_image.dart';
import 'package:moon_x/app/components/consturactor/const_text.dart';
import 'package:moon_x/app/components/helper/screen_size.dart';
import 'package:moon_x/app/widgets/custom_date_picker.dart';

class SecondDashboardPage extends StatefulWidget {
  const SecondDashboardPage({super.key});

  @override
  State<SecondDashboardPage> createState() => _SecondDashboardPageState();
}

class _SecondDashboardPageState extends State<SecondDashboardPage> {
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
            ImageEnum.secondImage.imagePath,
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: ScreenSize.screenHeight * 0.361),
              ConstText.getDescriptionText(),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: ScreenSize.screenHeight * 0.02),
                  ConstText.dashboardBoldTxt('Enter Birth Date'),
                  SizedBox(height: ScreenSize.screenHeight * 0.02),
                  const DatePickerBox(),
                  SizedBox(height: ScreenSize.screenHeight * 0.03),
                  ConstText.dashboardBoldTxt('Enter Birth Time'),
                  SizedBox(height: ScreenSize.screenHeight * 0.02),
                  const DatePickerBox(),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
