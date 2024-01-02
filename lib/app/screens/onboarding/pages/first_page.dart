import 'package:flutter/material.dart';
import 'package:moon_x/app/components/consturactor/const_image.dart';
import 'package:moon_x/app/components/consturactor/const_text.dart';
import 'package:moon_x/app/components/helper/screen_size.dart';

class FirstDashboardPage extends StatefulWidget {
  const FirstDashboardPage({super.key});

  @override
  State<FirstDashboardPage> createState() => _FirstDashboardPageState();
}

class _FirstDashboardPageState extends State<FirstDashboardPage> {
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
            ImageEnum.firstImage.imagePath,
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                'Welcome',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: ScreenSize.screenHeight * 0.04),
              ConstText.getDescriptionText(),
              SizedBox(
                height: ScreenSize.screenHeight * 0.15,
              ),
            ],
          )
        ],
      ),
    );
  }
}
