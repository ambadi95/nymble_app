import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nymble_app/src/themes/themes_services.dart';
import '../model/model_class.dart';

class HomeScreenController extends GetxController {

  ResponseData? responseData;

  Future loadData() async {
    await Future.delayed(const Duration(seconds: 1));
    final String response = await rootBundle.loadString('assets/data.json');
    responseData = ResponseData.fromMap(json.decode(response));
    bool isDarkMode = responseData?.app?.theme == 'dark' ? false : true;
    ThemeServices().saveThemeMode(isDarkMode);
    ThemeServices().changeThemeMode();
    update();
  }
}
