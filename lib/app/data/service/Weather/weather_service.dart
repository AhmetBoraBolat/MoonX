import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:moon_x/app/core/consturactor/sharedpref_key.dart';
import 'package:moon_x/app/core/helper/shared_preferences_helper.dart';
import 'package:moon_x/app/data/models/weather_model.dart';
import 'package:moon_x/app/data/service/Weather/weather_const.dart';

class WeatherService {
  final Dio _dio = Dio();
  String? _location;

  Future<WeatherModel> fetchWeather(
      double latitude, double longitude, DateTime? selectedDateTime) async {
    try {
      var apidate = selectedDateTime ?? WeatherConstructor.dateTimeWeatherNow;
      String formattedDate = DateFormat('yyyy-MM-dd').format(apidate);

      if (kDebugMode) {
        print('gelen gün veri : $formattedDate');
      }

      _location ??= await SharedPreferencesHelper.getStringData(
          SharedPrefKeys.userCity.name.toString());

      final response = await _dio.get(
        '${WeatherConstructor.baseUrl}/$_location/$formattedDate',
        queryParameters: {
          'unitGroup': 'us',
          'key': WeatherConstructor.weatherAPIKey,
          'location': '$latitude,$longitude',
          'include': 'days',
          'elements': 'datetime,sunrise,sunset,moonrise,moonset,temp',
        },
      );

      if (response.statusCode == 200) {
        WeatherModel weatherData = WeatherModel.fromJson(response.data);

        return weatherData;
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      throw Exception('Failed to fetch weather data: $e');
    }
  }
}
