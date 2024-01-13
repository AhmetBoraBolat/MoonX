import 'package:flutter/foundation.dart';
import 'package:moon_x/app/core/consturactor/sharedpref_key.dart';
import 'package:moon_x/app/core/helper/shared_preferences_helper.dart';
import 'package:moon_x/app/core/helper/zodiac_helper.dart';
import 'package:moon_x/app/data/models/chatgpt_content.dart';
import 'package:moon_x/app/data/service/chatGpt/chatgpt_service.dart';

class MainPageAIViewModel extends ChangeNotifier {
  bool isLoading = false;
  String zodiac = '';
  String zodiacImagePath = '';
  ChatGptSerivce service = ChatGptSerivce();
  String dateTimeBorn = '';
  String hourAndMinBorn = '';
  String gptContent = '';
  String gptCategory = '';
  String gptCategoryContent = '';
  int premiumCounter = 3;
  bool isLoadingCategoryContent = false;

  Future<void> getZodiac() async {
    await initSharedPref();
    zodiacImagePath = getZodiacImagePath(zodiac);
    await saveGptRequest();
    isLoading = true;
    notifyListeners();
  }

  Future<void> chatGptRequest() async {
    var gptModel = await service.getDefaultHoroscopePrediction(zodiac);
    gptContent = gptModel?.content ?? '';
    await SharedPreferencesHelper.saveStringData(
        SharedPrefKeys.gptContent.name, gptContent);
    notifyListeners();
  }

  Future<void> saveGptRequest() async {
    var check = await SharedPreferencesHelper.getBoolData(
        SharedPrefKeys.enteredBefore.name);
    if (check == true) {
      var contentCheck = await SharedPreferencesHelper.getStringData(
          SharedPrefKeys.gptContent.name);
      if (contentCheck != '' && contentCheck != null) {
        gptContent = contentCheck;
      } else {
        await chatGptRequest();
      }
    } else {
      await chatGptRequest();
    }
  }

  Future<void> chatGptCategoryRequest() async {
    ChatGptModel? gptModel;
    var resultPremium = await SharedPreferencesHelper.getIntData(
      SharedPrefKeys.premiumCounter.name,
    );
    if (resultPremium == null) {
      await SharedPreferencesHelper.saveIntData(
        SharedPrefKeys.premiumCounter.name,
        3,
      );
      resultPremium = 3;
    }
    premiumCounter = resultPremium;

    if (premiumCounter > 0) {
      if (gptCategory != '') {
        if (gptCategoryContent != '' && zodiac != '') {
          gptModel =
              await service.getCategoryHoroscopePrediction(zodiac, gptCategory);
          if (gptModel != null) {
            gptCategoryContent = gptModel.content;
          }
        }
      } else {
        gptModel =
            await service.getCategoryHoroscopePrediction(zodiac, 'Business');
        if (gptModel != null) {
          gptCategoryContent = gptModel.content;
        }
      }
      premiumCounter--;
    } else if (premiumCounter == 0) {
      gptCategoryContent = 'For more horoscope readings, purchase premium.';
    } else if (premiumCounter == -1) {
      if (gptCategory != '') {
        if (gptCategoryContent != '' && zodiac != '') {
          gptModel =
              await service.getCategoryHoroscopePrediction(zodiac, gptCategory);
          if (gptModel != null) {
            gptCategoryContent = gptModel.content;
          }
        }
      } else {
        gptModel =
            await service.getCategoryHoroscopePrediction(zodiac, 'Business');
        if (gptModel != null) {
          gptCategoryContent = gptModel.content;
        }
      }
    }
    await SharedPreferencesHelper.saveIntData(
        SharedPrefKeys.premiumCounter.name, premiumCounter);
    notifyListeners();
  }

  Future<void> initSharedPref() async {
    final resultZodiac =
        await SharedPreferencesHelper.getStringData(SharedPrefKeys.zodiac.name);
    final resultDate = await SharedPreferencesHelper.getStringData(
        SharedPrefKeys.dateTime.name);
    final resultHourMin = await SharedPreferencesHelper.getStringData(
        SharedPrefKeys.hourAndMin.name);

    zodiac = resultZodiac ?? '';
    dateTimeBorn = resultDate ?? '';
    hourAndMinBorn = resultHourMin ?? '';
  }

  Future<void> changeCategory(String category) async {
    if (category != '') {
      gptCategory = category;
      if (!isLoadingCategoryContent) {
        isLoadingCategoryContent = true;
        notifyListeners();
        await chatGptCategoryRequest();
        isLoadingCategoryContent = false;
        notifyListeners();
      }
    }
  }

  Future<void> buyPremium() async {
    premiumCounter = -1;
    await SharedPreferencesHelper.saveIntData(
      SharedPrefKeys.premiumCounter.name,
      premiumCounter,
    );
    notifyListeners();
  }
}
