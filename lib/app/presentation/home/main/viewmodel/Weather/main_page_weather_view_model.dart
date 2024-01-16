import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:moon_x/app/core/constructor/sharedpref_key.dart';
import 'package:moon_x/app/core/helper/shared_preferences_helper.dart';
import 'package:moon_x/app/data/models/weather_model.dart';
import 'package:moon_x/app/data/service/Weather/weather_service.dart';

class MainPageWeatherViewModel extends ChangeNotifier {
  String? moonRise;
  String? moonSet;
  String? sunRise;
  String? sunSet;
  double? temP;
  String? resultdateTime;
  double? longitude;
  String? locationCountry;
  double? latitude;
  DateTime? dateTimes;
  final WeatherService _ws = WeatherService();

  Future<void> initSharedPref() async {
    final resultLongItude = await SharedPreferencesHelper.getDoubleData(
        SharedPrefKeys.longitude.name);
    final resultlatitTude = await SharedPreferencesHelper.getDoubleData(
        SharedPrefKeys.latitude.name);

    longitude = resultLongItude ?? 0;
    latitude = resultlatitTude ?? 0;

    notifyListeners();
  }

  Future<void> fetchWeatherResult() async {
    await initSharedPref();
    try {
      WeatherModel weatherData =
          await _ws.fetchWeather(latitude!, longitude!, dateTimes);

      moonSet = _apiResultSplit(weatherData.days![0].moonset ?? '');

      moonRise = _apiResultSplit(weatherData.days![0].moonrise ?? '');

      sunRise = _apiResultSplit(weatherData.days![0].sunrise ?? '');

      sunSet = _apiResultSplit(weatherData.days![0].sunset ?? '');

      temP = fahrenheitToCelsius(weatherData.days![0].temp ?? 0);

      var resultdate = weatherData.days![0].datetime;
      var resultDateParse = DateTime.parse(resultdate!);
      resultdateTime = DateFormat('d MMM').format(resultDateParse);

      var location = weatherData.timezone;
      List<String> parts = location!.split('/');
      if (parts.length == 2) {
        locationCountry = '${parts[1]}, ${parts[0]}';
      }
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print('Hata oluştu: $e');
      }
    }
  }

  String _apiResultSplit(String moonRiseTime) {
    List<String> timeParts = moonRiseTime.split(':');

    String hour = timeParts[0];
    String minute = timeParts[1];

    String formattedTime = '$hour.$minute';

    return formattedTime;
  }

  double fahrenheitToCelsius(double selectedTemp) {
    var deneme = (selectedTemp - 32) * 5 / 9;

    return deneme;
  }

  void changeCalendarDate(DateTime date) async {
    dateTimes = date;
    await fetchWeatherResult();
    notifyListeners();
  }
}
