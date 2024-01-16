import 'package:flutter/material.dart';
import 'package:moon_x/app/core/constructor/sharedpref_key.dart';
import 'package:moon_x/app/core/helper/screen_size.dart';
import 'package:moon_x/app/core/helper/shared_preferences_helper.dart';
import 'package:moon_x/app/presentation/home/home_page.dart';
import 'package:moon_x/app/presentation/onboarding/viewmodel/onboarding_view_model.dart';
import 'package:moon_x/app/presentation/onboarding/widget/custom_continue_button.dart';
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
  void initState() {
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    var check = await context.read<OnboardingViewModel>().initControl();
    if (check) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (localContext) => const HomePage()));
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ScreenSize.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemBuilder: (context, index) {
              return Provider.of<OnboardingViewModel>(context).pages[index];
            },
            itemCount: Provider.of<OnboardingViewModel>(context).pages.length,
          ),
          Positioned(
            bottom: ScreenSize.screenHeight * 0.08,
            left: 0,
            right: 0,
            child: Column(
              children: [
                SmoothPageIndicator(
                  controller: _pageController,
                  count: Provider.of<OnboardingViewModel>(context).pages.length,
                  effect: const JumpingDotEffect(
                    dotColor: Color(0xFF181D38),
                    activeDotColor: Color(0xFF535FD8),
                    dotHeight: 8,
                    dotWidth: 8,
                    jumpScale: 3,
                  ),
                ),
                SizedBox(
                  height: ScreenSize.screenHeight * 0.025,
                ),
                ContinueButton(onPressed: () {
                  context
                          .read<OnboardingViewModel>()
                          .changePageIndex(_pageController)
                      // ignore: avoid_print
                      ? print('ok')
                      : Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
                  SharedPreferencesHelper.saveBoolData(
                      SharedPrefKeys.enteredBefore.name, true);
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
