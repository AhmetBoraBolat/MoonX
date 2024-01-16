import 'package:flutter/material.dart';
import 'package:moon_x/app/core/constructor/const_image.dart';
import 'package:moon_x/app/core/helper/screen_size.dart';
import 'package:moon_x/app/presentation/home/main/viewmodel/AI/main_page_ai_view_model.dart';
import 'package:provider/provider.dart';

class MainCard extends StatefulWidget {
  const MainCard({
    super.key,
  });

  @override
  State<MainCard> createState() => _MainCardState();
}

class _MainCardState extends State<MainCard> {
  late MainPageAIViewModel _viewModel;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _viewModel = Provider.of<MainPageAIViewModel>(context, listen: false);
    _initializeZodiac();
  }

  Future<void> _initializeZodiac() async {
    await _viewModel.getZodiac();
  }

  @override
  Widget build(BuildContext context) {
    _isLoading = context.watch<MainPageAIViewModel>().isLoading;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: ScreenSize.screenWidth * 0.06,
          vertical: ScreenSize.screenHeight * 0.01),
      child: Stack(
        children: [
          SizedBox(
            child: Image.asset(
              ImageEnum.homeHoroscopeImage.imagePath,
              fit: BoxFit.fill,
              height: ScreenSize.screenHeight * 0.14,
              width: ScreenSize.screenWidth * 0.88,
            ),
          ),
          _isLoading
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: ScreenSize.screenWidth * 0.02,
                    ),
                    SizedBox(
                      height: ScreenSize.screenHeight * 0.14,
                      width: ScreenSize.screenWidth * 0.27,
                      child: Image.asset(
                        context.watch<MainPageAIViewModel>().zodiacImagePath,
                        scale: 1.5,
                      ),
                    ),
                    SizedBox(
                      width: ScreenSize.screenWidth * 0.05,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.watch<MainPageAIViewModel>().zodiac,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          'Your Daily Horoscope',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ],
                )
              : Center(
                  child: SizedBox(
                    height: ScreenSize.screenHeight * 0.13,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
