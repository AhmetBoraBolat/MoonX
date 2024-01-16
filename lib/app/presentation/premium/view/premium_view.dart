import 'package:flutter/material.dart';
import 'package:moon_x/app/core/constructor/const_text.dart';
import 'package:moon_x/app/core/helper/screen_size.dart';
import 'package:moon_x/app/presentation/home/main/viewmodel/AI/main_page_ai_view_model.dart';
import 'package:moon_x/app/presentation/home/settings/webview/webview.dart';
import 'package:moon_x/app/presentation/premium/widget/custom_blur_efect.dart';
import 'package:moon_x/app/presentation/premium/widget/custom_premium_checkbox.dart';
import 'package:moon_x/app/presentation/premium/widget/custom_premium_image.dart';
import 'package:provider/provider.dart';

class PremiumPage extends StatefulWidget {
  const PremiumPage({super.key});

  @override
  State<PremiumPage> createState() => _PremiumPageState();
}

class _PremiumPageState extends State<PremiumPage> {
  bool isSelected1 = true;
  bool isSelected2 = false;
  bool isSelected3 = false;
  String buttonText = '6.99';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: ConstText.dashboardBoldTxt(
            'Lorem Ipssum\n'
            '     Dolar Sit',
            context),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close)),
        ],
      ),
      body: Stack(
        children: [
          _textColumn(),
          const PremiumBlurEfect(),
          const CustomPremiumImage(),
          Positioned(
            top: ScreenSize.screenHeight * 0.38,
            right: 0,
            left: 0,
            child: Column(
              children: [
                PremiumCheckBox(
                    popular: false,
                    text: '50 unique avatars',
                    price: '6.99',
                    isSelected: isSelected1,
                    onTap: () {
                      setState(() {
                        isSelected1 = !isSelected1;
                        buttonText = '6.99';
                        isSelected2 = false;
                        isSelected3 = false;
                      });
                    }),
                PremiumCheckBox(
                    popular: true,
                    text: '100 unique avatars',
                    price: '9.99/m',
                    isSelected: isSelected2,
                    onTap: () {
                      setState(() {
                        isSelected2 = !isSelected2;
                        buttonText = '9.99';
                        isSelected1 = false;
                        isSelected3 = false;
                      });
                    }),
                PremiumCheckBox(
                    popular: false,
                    text: '200 unique avatars',
                    price: '10.99',
                    isSelected: isSelected3,
                    onTap: () {
                      setState(() {
                        isSelected3 = !isSelected3;
                        buttonText = '10.99';
                        isSelected1 = false;
                        isSelected2 = false;
                      });
                    }),
              ],
            ),
          ),
          premiumButton(buttonText),
          premiumWebView(context),
        ],
      ),
    );
  }

  Positioned premiumWebView(BuildContext context) {
    return Positioned(
      right: 0,
      left: 0,
      bottom: ScreenSize.screenHeight * 0.03,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const WebviewPage()));
            },
            child: const Text(
              'Privacy Policy',
              style: TextStyle(
                color: Colors.white,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const WebviewPage()));
            },
            child: const Text(
              'Restore Purchase',
              style: TextStyle(
                color: Colors.white,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const WebviewPage()));
            },
            child: const Text(
              'Terms of Use',
              style: TextStyle(
                color: Colors.white,
                decoration: TextDecoration.underline,
              ),
            ),
          )
        ],
      ),
    );
  }

  Positioned premiumButton(String text) {
    return Positioned(
      top: ScreenSize.screenHeight * 0.68,
      right: ScreenSize.screenWidth * 0.15,
      left: ScreenSize.screenWidth * 0.15,
      child: ElevatedButton(
        onPressed: () async {
          await context.read<MainPageAIViewModel>().buyPremium();
          // ignore: use_build_context_synchronously
          Navigator.pop(context);
        },
        style: ButtonStyle(
          padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
            vertical: ScreenSize.screenHeight * 0.025,
            horizontal: 15,
          )),
          backgroundColor: const MaterialStatePropertyAll(Color(0xFF535FD8)),
          elevation: const MaterialStatePropertyAll(0),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        child: Text('Purchase for \$$text',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
      ),
    );
  }

  Column _textColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: ScreenSize.screenHeight * 0.02,
        ),
        Text(
          'Why do I need to pay?',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(
          height: ScreenSize.screenHeight * 0.02,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: ScreenSize.screenWidth * 0.035,
          ),
          child: Text(
            'Experience a virtual presence like never before, crafted just for you.\n'
            'despite the computational demands, we offer this innovative\n'
            'solution at an affordable price.\n',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
