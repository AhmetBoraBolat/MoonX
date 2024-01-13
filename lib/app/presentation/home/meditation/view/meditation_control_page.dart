import 'package:flutter/material.dart';
import 'package:moon_x/app/core/helper/screen_size.dart';
import 'package:moon_x/app/presentation/home/meditation/view/meditation_first_page.dart';
import 'package:moon_x/app/presentation/home/meditation/view/meditation_second_page.dart';
import 'package:moon_x/app/presentation/home/meditation/view/meditation_third_page.dart';

class MeditationPage extends StatefulWidget {
  const MeditationPage({
    super.key,
  });

  @override
  State<MeditationPage> createState() => _MeditationPageState();
}

class _MeditationPageState extends State<MeditationPage> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ScreenSize.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF292B42),
                  Color(0xFF010101),
                ],
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: ScreenSize.screenHeight * 0.2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildButton('Meditation', 0),
                    _buildButton('Yoga', 1),
                    _buildButton('Music', 2),
                  ],
                ),
              ),
              Expanded(
                child: PageView.builder(
                  allowImplicitScrolling: false,
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  itemCount: 3, // Toplam sayfa sayısı
                  itemBuilder: (BuildContext context, int index) {
                    // Her sayfa oluşturma işlemi
                    switch (index) {
                      case 0:
                        return const MeditationFirstPage();
                      case 1:
                        return const MeditationSecondPage();
                      case 2:
                        return const MeditationThirdPage();
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String title, int index) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: ScreenSize.screenWidth * 0.04),
      constraints: const BoxConstraints(maxHeight: 33.0),
      decoration: BoxDecoration(
        border: const Border.symmetric(
          vertical: BorderSide(color: Colors.white, width: 0.1),
        ),
        borderRadius: BorderRadius.circular(6.0),
        color: _selectedIndex == index
            ? const Color(0xFF535FD8)
            : Colors.grey[700],
      ),
      child: Container(
        alignment: Alignment.center,
        child: TextButton(
          onPressed: () {
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.linear,
            );
          },
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0),
              ),
            ),
          ),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
