import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../model/model_class.dart';

class HomeScreenController extends GetxController {

  ResponseData? responseData;

  final List<Item>? itemsBanner = [];
  final List<Item>? collections = [];
  final List<Item>? cuisines = [];

  Future loadData() async {
    final String response = await rootBundle.loadString('assets/data.json');
    responseData = ResponseData.fromMap(json.decode(response));
    for (var element in responseData!.widgets!) {
      switch (element.title) {
        case "Banner":
          for (var element in element.items!) {
            itemsBanner!.add(element);
          }
          break;
        case "Collections":
          for (var element in element.items!) {
            collections!.add(element);
          }
          break;
        case "Cuisines":
          for (var element in element.items!) {
            cuisines!.add(element);
          }
      }
    }
    update();
  }
}
