import 'package:flutter/material.dart';
import 'package:moon_x/app/core/constructor/sharedpref_key.dart';
import 'package:moon_x/app/core/helper/shared_preferences_helper.dart';
import 'package:moon_x/app/presentation/onboarding/view/first_page.dart';
import 'package:moon_x/app/presentation/onboarding/view/second_page.dart';
import 'package:moon_x/app/presentation/onboarding/view/third_page.dart';

class OnboardingViewModel with ChangeNotifier {
  DateTime selectedDate = DateTime.now();

  bool changePageIndex(PageController pageController) {
    if (pageController.page != null) {
      int currentPage = pageController.page!.round();

      if (currentPage < pages.length - 1) {
        pageController.animateToPage(
          currentPage + 1,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        return true;
      } else {
        return false;
      }
    }
    notifyListeners();
    return true;
  }

  Future<bool> initControl() async {
    var control = await SharedPreferencesHelper.getBoolData(
        SharedPrefKeys.enteredBefore.name);
    if (control != null) {
      return control;
    } else {
      SharedPreferencesHelper.saveBoolData(
          SharedPrefKeys.enteredBefore.name, false);
      return false;
    }
  }

  List pages = [
    const FirstOnboardingPage(),
    const SecondOnboardingPage(),
    const ThirdOnboardingPage(),
  ];
}
