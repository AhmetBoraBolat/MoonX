import 'package:flutter/foundation.dart';
import 'package:moon_x/app/core/consturactor/const_image.dart';
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

    if (gptCategory != '') {
      if (gptCategoryContent != '' && zodiac != '') {
        gptModel =
            await service.getCategoryHoroscopePrediction(zodiac, gptCategory);
        if (gptModel != null) {
          gptCategoryContent = gptModel.content;

          notifyListeners();
        }
      }
    } else {
      gptModel =
          await service.getCategoryHoroscopePrediction(zodiac, 'Business');
      if (gptModel != null) {
        gptCategoryContent = gptModel.content;

        notifyListeners();
      }
    }
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
      await chatGptCategoryRequest();
      notifyListeners();
    }
  }

  String getCategoryImage() {
    switch (gptCategory) {
      case 'Business':
        return ImageEnum.homeCategoryBusiness.imagePath;
      case 'Food':
        return ImageEnum.homeCategoryFood.imagePath;
      case 'Relations':
        return ImageEnum.homeCategoryRelations.imagePath;
      default:
        return ImageEnum.homeCategoryBusiness.imagePath;
    }
  }
}
