import 'package:flutter/material.dart';
import 'package:moon_x/app/screens/onboarding/onboarding.dart';
import 'package:moon_x/app/screens/onboarding/onboarding_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OnboardingViewModel(),
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(
          appBarTheme: const AppBarTheme().copyWith(
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const OnBoarding(),
      ),
    );
  }
}
