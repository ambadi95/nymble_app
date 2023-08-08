

import 'package:get/get.dart';
import 'package:nymble_app/src/screens/home_screen/controller/home_screen_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies(){
    Get.lazyPut(() => HomeScreenController());

  }
}