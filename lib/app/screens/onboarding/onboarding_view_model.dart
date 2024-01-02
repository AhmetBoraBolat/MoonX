import 'package:flutter/material.dart';
import 'package:moon_x/app/screens/onboarding/pages/first_page.dart';
import 'package:moon_x/app/screens/onboarding/pages/second_page.dart';
import 'package:moon_x/app/screens/onboarding/pages/third_page.dart';

class OnboardingViewModel with ChangeNotifier {
  void changePageIndex(PageController pageController) {
    if (pageController.page != null) {
      int currentPage = pageController.page!.round();

      if (currentPage < pages.length - 1) {
        pageController.animateToPage(
          currentPage + 1,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      } else {}
    }
  }

  List pages = [
    const FirstDashboardPage(),
    const SecondDashboardPage(),
    const ThirdDashboardPage(),
  ];
}
