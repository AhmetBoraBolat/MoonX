import 'package:flutter/material.dart';
import 'package:moon_x/app/core/icon/moon_x_icons.dart';
import 'package:moon_x/app/presentation/home/main/view/main_page.dart';
import 'package:moon_x/app/presentation/home/meditation/view/meditation_control_page.dart';
import 'package:moon_x/app/presentation/home/meditation/widget/music_control_box.dart';
import 'package:moon_x/app/presentation/home/settings/view/settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int _currentIndex = 0;

  final List _pages = [
    const MainPage(),
    const MeditationPage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          _pages[_currentIndex],
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: MusicControlWidget(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: const Color(0xFF535FD8),
        unselectedItemColor: const Color(0xFFc2c2c2),
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(MoonX.btn_tabbar_homeunselected),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(MoonX.btn_tabbar_meditationunselected),
            label: '   Meditation',
          ),
          BottomNavigationBarItem(
            icon: Icon(MoonX.btn_tabbar_profileunselected),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
