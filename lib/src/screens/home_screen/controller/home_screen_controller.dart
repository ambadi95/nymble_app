import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../model/model_class.dart';

class HomeScreenController extends GetxController {

  ResponseData? responseData;

  Future loadData() async {
    final String response = await rootBundle.loadString('assets/data.json');
    responseData = ResponseData.fromMap(json.decode(response));
    update();
  }
}
