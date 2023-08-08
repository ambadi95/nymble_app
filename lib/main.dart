import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nymble_app/src/binding/app_binding.dart';
import 'package:nymble_app/src/screens/home_screen/view/home_screen_view.dart';
import 'package:nymble_app/src/themes/themes.dart';
import 'package:nymble_app/src/themes/themes_services.dart';

void main() async{
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AppBinding(),
      theme: Themes().lightTheme,
      darkTheme: Themes().darkTheme,
      themeMode: ThemeServices().getThemeMode(),
      home: const HomeScreenView(),
    );
  }
}
