enum ImageEnum {
  onboardingfirstImage,
  onboardingsecondImage,
  onboardingthirdImage,
  homeBackgroundImage,
  homeMoonImage,
  homeHoroscopeImage,
  homeCategoryBusiness,
  homeCategoryFood,
  homeCategoryRelations,
  homeMoonRise,
  homeMoonSet,
  homeSunRise,
  homeSunSet,
  meditationSmalImage,
  meditationImage,
  meditationSmalWomenImage,
  meditationWomenImage,
  meditationBlueMusicImage,
  meditationGreenMusicImage,
  meditationPurpleImage,
  meditationRedImage,
  settingsHelpImage,
  settingsPremiumBannerImage,
  settingsPremiumIconImage,
  settingsPrivacyImage,
  settingsRateImage,
  settingsRestoreImage,
  settingsTermsImage,
  premiumInApp1,
  premiumInApp2,
  premiumInApp3,
  premiumBlur,
  premiumCheckBoxSelected,
  premiumCheckBoxUnselected,
  premiumCheckMostPopular,
}

const Map<ImageEnum, String> imagePaths = {
  ImageEnum.onboardingfirstImage: 'assets/onboarding/img_background_first.png',
  ImageEnum.onboardingsecondImage:
      'assets/onboarding/img_background_second.png',
  ImageEnum.onboardingthirdImage: 'assets/onboarding/img_background_third.png',
  ImageEnum.homeBackgroundImage: 'assets/home/img_home_background.png',
  ImageEnum.homeMoonImage: 'assets/home/img_home_moon.png',
  ImageEnum.homeHoroscopeImage: 'assets/home/img_home_horoscopebanner.png',
  ImageEnum.homeCategoryBusiness: 'assets/home/category/img_business.png',
  ImageEnum.homeCategoryFood: 'assets/home/category/img_food.png',
  ImageEnum.homeCategoryRelations: 'assets/home/category/img_relations.png',
  ImageEnum.homeMoonRise: 'assets/home/weather/moonrise.png',
  ImageEnum.homeMoonSet: 'assets/home/weather/moonset.png',
  ImageEnum.homeSunRise: 'assets/home/weather/sunrise.png',
  ImageEnum.homeSunSet: 'assets/home/weather/sunset.png',
  ImageEnum.meditationSmalImage:
      'assets/meditation/img/image_meditation_small.png',
  ImageEnum.meditationImage: 'assets/meditation/img/img_meditation.png',
  ImageEnum.meditationSmalWomenImage:
      'assets/meditation/img/img_meditation_women_small.png',
  ImageEnum.meditationWomenImage:
      'assets/meditation/img/img_meditation_women.png',
  ImageEnum.meditationBlueMusicImage:
      'assets/meditation/img/img_blue_music1.png',
  ImageEnum.meditationGreenMusicImage:
      'assets/meditation/img/img_green_music4.png',
  ImageEnum.meditationPurpleImage:
      'assets/meditation/img/img_purple_music2.png',
  ImageEnum.meditationRedImage: 'assets/meditation/img/img_red_music3.png',
  ImageEnum.settingsHelpImage: 'assets/settings/img_help.png',
  ImageEnum.settingsPremiumBannerImage:
      'assets/settings/img_premium_banner.png',
  ImageEnum.settingsPremiumIconImage: 'assets/settings/img_premium_icon.png',
  ImageEnum.settingsPrivacyImage: 'assets/settings/img_privacy.png',
  ImageEnum.settingsRateImage: 'assets/settings/img_rate.png',
  ImageEnum.settingsRestoreImage: 'assets/settings/img_restore.png',
  ImageEnum.settingsTermsImage: 'assets/settings/img_terms.png',
  ImageEnum.premiumInApp1: 'assets/premium/img_inapp1.png',
  ImageEnum.premiumInApp2: 'assets/premium/img_inapp2.png',
  ImageEnum.premiumInApp3: 'assets/premium/img_inapp3.png',
  ImageEnum.premiumBlur: 'assets/premium/Ellipse_blur.png',
  ImageEnum.premiumCheckBoxSelected: 'assets/premium/btn_checkbox_selected.png',
  ImageEnum.premiumCheckBoxUnselected:
      'assets/premium/btn_checkbox_unselected.png',
  ImageEnum.premiumCheckMostPopular: 'assets/premium/img_inapp_mostpopular.png',
};

extension ImageEnumExtension on ImageEnum {
  String get imagePath {
    //print(imagePaths);
    return imagePaths[this] ?? '';
  }
}
