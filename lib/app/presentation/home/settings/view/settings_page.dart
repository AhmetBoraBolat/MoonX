import 'package:flutter/material.dart';
import 'package:moon_x/app/core/consturactor/const_image.dart';
import 'package:moon_x/app/core/consturactor/const_text.dart';
import 'package:moon_x/app/core/helper/screen_size.dart';
import 'package:moon_x/app/presentation/home/main/viewmodel/AI/main_page_ai_view_model.dart';
import 'package:moon_x/app/presentation/home/settings/widget/custom_premium_banner.dart';
import 'package:moon_x/app/presentation/home/settings/widget/custom_settings_list.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    var vm = context.watch<MainPageAIViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: ConstText.dashboardBoldTxt('Settings', context),
      ),
      backgroundColor: const Color(0xFF040406),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              vm.premiumCounter != -1
                  ? SizedBox(
                      height: ScreenSize.screenHeight * 0.02,
                    )
                  : const SizedBox.shrink(),
              vm.premiumCounter != -1
                  ? const CustomPremiumBanner()
                  : const SizedBox.shrink(),
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
      ),
    );
  }
}
