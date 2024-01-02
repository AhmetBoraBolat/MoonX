import 'package:flutter/material.dart';
import 'package:moon_x/app/screens/onboarding/onboarding_view_model.dart';
import 'package:moon_x/app/widgets/custom_continue_button.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: Stack(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemBuilder: (context, index) {
                return OnboardingViewModel().pages[index];
              },
              itemCount: OnboardingViewModel().pages.length,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                SmoothPageIndicator(
                  controller: _pageController,
                  count: OnboardingViewModel().pages.length,
                  effect: const JumpingDotEffect(
                    dotColor: Color(0xFF181D38),
                    activeDotColor: Color(0xFF535FD8),
                    dotHeight: 8,
                    dotWidth: 8,
                    jumpScale: 3,
                  ),
                ),
                ContinueButton(onPressed: () {
                  context
                      .read<OnboardingViewModel>()
                      .changePageIndex(_pageController);
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
