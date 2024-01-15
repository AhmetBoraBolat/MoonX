import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moon_x/app/presentation/home/main/viewmodel/AI/main_page_ai_view_model.dart';
import 'package:moon_x/app/presentation/home/meditation/viewmodel/music_page_view_model.dart';
import 'package:moon_x/app/presentation/onboarding/view/onboarding.dart';
import 'package:moon_x/app/presentation/onboarding/viewmodel/onboarding_view_model.dart';
import 'package:provider/provider.dart';

import 'app/presentation/home/main/viewmodel/Weather/main_page_weather_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => OnboardingViewModel()),
        ChangeNotifierProvider(create: (context) => MainPageAIViewModel()),
        ChangeNotifierProvider(create: (context) => MainPageWeatherViewModel()),
        ChangeNotifierProvider(create: (context) => MusicViewModel()),
      ],
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(
            appBarTheme: const AppBarTheme().copyWith(
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            scaffoldBackgroundColor: Colors.transparent,
            textTheme: const TextTheme(
                bodyLarge: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white))),
        debugShowCheckedModeBanner: false,
        home: const OnBoarding(),
      ),
    );
  }
}
