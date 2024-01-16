import 'package:flutter/material.dart';
import 'package:moon_x/app/core/constructor/const_image.dart';
import 'package:moon_x/app/core/constructor/const_text.dart';
import 'package:moon_x/app/core/helper/screen_size.dart';
import 'package:moon_x/app/presentation/home/main/viewmodel/Weather/main_page_weather_view_model.dart';
import 'package:provider/provider.dart';

class CustomMainWeatherColumn extends StatefulWidget {
  const CustomMainWeatherColumn({super.key});

  @override
  State<CustomMainWeatherColumn> createState() =>
      _CustomMainWeatherColumnState();
}

class _CustomMainWeatherColumnState extends State<CustomMainWeatherColumn> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ScreenSize.init(context);
  }

  @override
  void initState() {
    super.initState();
    _initWeatherApiResult();
  }

  void _initWeatherApiResult() async {
    await context.read<MainPageWeatherViewModel>().fetchWeatherResult();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: ScreenSize.screenHeight * 0.07,
        ),
        ConstText.dashboardBoldTxt('Good Morning !', context),
        SizedBox(
          height: ScreenSize.screenHeight * 0.01,
        ),
        Text('${context.watch<MainPageWeatherViewModel>().locationCountry}'),
        SizedBox(
          height: ScreenSize.screenHeight * 0.01,
        ),
        Image.asset(
          ImageEnum.homeMoonImage.imagePath,
          fit: BoxFit.fill,
          height: ScreenSize.screenHeight * 0.15,
        ),
        SizedBox(
          height: ScreenSize.screenHeight * 0.02,
        ),
        ConstText.dashboardBoldTxt(
            '${context.watch<MainPageWeatherViewModel>().resultdateTime} 11.49',
            context),
        SizedBox(
          height: ScreenSize.screenHeight * 0.01,
        ),
        Text(
            'Sunny, ${context.watch<MainPageWeatherViewModel>().temP?.toInt()} C'),
        SizedBox(
          height: ScreenSize.screenHeight * 0.04,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            moonAndSun(ImageEnum.homeMoonSet.imagePath,
                context.watch<MainPageWeatherViewModel>().moonSet),
            moonAndSun(ImageEnum.homeMoonRise.imagePath,
                context.watch<MainPageWeatherViewModel>().moonRise),
            moonAndSun(ImageEnum.homeSunSet.imagePath,
                context.watch<MainPageWeatherViewModel>().sunSet),
            moonAndSun(ImageEnum.homeSunRise.imagePath,
                context.watch<MainPageWeatherViewModel>().sunRise),
          ],
        ),
      ],
    );
  }

  Container moonAndSun(String imageAsset, String? apiResult) {
    return Container(
      decoration: const BoxDecoration(
          color: Color.fromRGBO(252, 252, 252, 0.09),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: EdgeInsets.all(ScreenSize.screenWidth * 0.028),
        child: Row(
          children: [
            Image.asset(imageAsset),
            Text(apiResult ?? ''),
          ],
        ),
      ),
    );
  }
}
