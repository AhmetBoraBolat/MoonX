import 'package:flutter/material.dart';
import 'package:moon_x/app/core/consturactor/const_image.dart';
import 'package:moon_x/app/core/consturactor/const_text.dart';
import 'package:moon_x/app/core/helper/screen_size.dart';
import 'package:moon_x/app/presentation/home/settings/widget/custom_premium_banner.dart';
import 'package:moon_x/app/presentation/home/settings/widget/custom_settings_list.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ConstText.dashboardBoldTxt('Settings', 20),
      ),
      backgroundColor: const Color(0xFF040406),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: ScreenSize.screenHeight * 0.02,
            ),
            const CustomPremiumBanner(),
            SizedBox(
              height: ScreenSize.screenHeight * 0.01,
            ),
            SettingsListElements(
              img: ImageEnum.settingsPrivacyImage.imagePath,
              text: 'Privacy Policy',
            ),
            SettingsListElements(
              img: ImageEnum.settingsTermsImage.imagePath,
              text: 'Terms of Use',
            ),
            SettingsListElements(
              img: ImageEnum.settingsRestoreImage.imagePath,
              text: 'Restore Purchase',
            ),
            SettingsListElements(
              img: ImageEnum.settingsHelpImage.imagePath,
              text: 'Help Us',
            ),
            SettingsListElements(
              img: ImageEnum.settingsRateImage.imagePath,
              text: 'Rate Us',
            ),
          ],
        ),
      ),
    );
  }
}
