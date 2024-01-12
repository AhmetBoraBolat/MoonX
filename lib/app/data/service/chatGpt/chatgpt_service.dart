import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:moon_x/app/data/models/chatgpt_content.dart';
import 'package:moon_x/app/data/service/chatGpt/ai_const.dart';

class ChatGptSerivce {
  Future<ChatGptModel?> getDefaultHoroscopePrediction(String zodiac) async {
    String contentText = '$zodiac horoscope interpretation should be consistent'
        'of no more than 70 words and in a single paragraph';
    final dio = Dio();

    // Headers
    dio.options.headers['Authorization'] = 'Bearer ${AiConstructor.apiKey}';
    dio.options.headers['Content-Type'] = 'application/json';

    final requestBody = {
      'model': AiConstructor.model,
      'messages': [
        {"role": AiConstructor.role, "content": contentText}
      ],
      'temperature': 0.7
    };
    try {
      final response = await dio.post(
        AiConstructor.baseUrl,
        data: requestBody,
      );
      if (response.statusCode == 200) {
        var msgData = response.data;
        if (msgData.containsKey('choices')) {
          var content = msgData['choices'][0]['message']['content'];
          return ChatGptModel(content);
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return null;
  }

  Future<ChatGptModel?> getCategoryHoroscopePrediction(
      String zodiac, String cateGory) async {
    String contentText =
        '$zodiac horoscope $cateGory interpretation should be consistent'
        'of no more than 100 words and in a single paragraph';
    final dio = Dio();

    // Headers
    dio.options.headers['Authorization'] = 'Bearer ${AiConstructor.apiKey}';
    dio.options.headers['Content-Type'] = 'application/json';

    final requestBody = {
      'model': AiConstructor.model,
      'messages': [
        {"role": AiConstructor.role, "content": contentText}
      ],
      'temperature': 0.7
    };
    try {
      final response = await dio.post(
        AiConstructor.baseUrl,
        data: requestBody,
      );
      if (response.statusCode == 200) {
        var msgData = response.data;
        if (msgData.containsKey('choices')) {
          var content = msgData['choices'][0]['message']['content'];
          return ChatGptModel(content);
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return null;
  }
}
