

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeServices {
  final _getStorage = GetStorage();
  final _storageKey = "isDarkMode";

  ThemeMode getThemeMode(){
    return isSavedDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }
  
  bool isSavedDarkMode(){
    return _getStorage.read(_storageKey) ?? false;
  }

  void saveThemeMode(bool isDarkMode){
    _getStorage.write(_storageKey, isDarkMode);
  }

  void changeThemeMode(){
    Get.changeThemeMode(isSavedDarkMode() ? ThemeMode.light : ThemeMode.dark);
    saveThemeMode(!isSavedDarkMode());
  }

}