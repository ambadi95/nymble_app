// To parse this JSON data, do
//
//     final responseData = responseDataFromMap(jsonString);

import 'dart:convert';

ResponseData responseDataFromMap(String str) => ResponseData.fromMap(json.decode(str));

String responseDataToMap(ResponseData data) => json.encode(data.toMap());

class ResponseData {
  final App? app;
  final List<Widget>? widgets;

  ResponseData({
    this.app,
    this.widgets,
  });

  factory ResponseData.fromMap(Map<String, dynamic> json) => ResponseData(
    app: json["app"] == null ? null : App.fromMap(json["app"]),
    widgets: json["widgets"] == null ? [] : List<Widget>.from(json["widgets"]!.map((x) => Widget.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "app": app?.toMap(),
    "widgets": widgets == null ? [] : List<dynamic>.from(widgets!.map((x) => x.toMap())),
  };
}

class App {
  final String? theme;

  App({
    this.theme,
  });

  factory App.fromMap(Map<String, dynamic> json) => App(
    theme: json["theme"],
  );

  Map<String, dynamic> toMap() => {
    "theme": theme,
  };
}

class Widget {
  final String? type;
  final String? title;
  final List<Item>? items;

  Widget({
    this.type,
    this.title,
    this.items,
  });

  factory Widget.fromMap(Map<String, dynamic> json) => Widget(
    type: json["type"],
    title: json["title"],
    items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "type": type,
    "title": title,
    "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toMap())),
  };
}

class Item {
  final String? image;
  final String? headerText;
  final String? footerText;
  final bool? footerIcon;
  final String? type;
  final double? padding;
  final double? borderRadius;
  final String? color;
  final String? text;

  Item({
    this.image,
    this.headerText,
    this.footerText,
    this.footerIcon,
    this.type,
    this.padding,
    this.borderRadius,
    this.color,
    this.text,
  });

  factory Item.fromMap(Map<String, dynamic> json) => Item(
    image: json["image"],
    headerText: json["header_text"],
    footerText: json["footer_text"],
    footerIcon: json["footer_icon"],
    type: json["type"],
    borderRadius: json["borderRadius"]?.toDouble(),
    padding: json["padding"]?.toDouble(),
    color: json["color"],
    text: json["text"],
  );

  Map<String, dynamic> toMap() => {
    "image": image,
    "header_text": headerText,
    "footer_text": footerText,
    "footer_icon": footerIcon,
    "type": type,
    "borderRadius" : borderRadius,
    "padding" : padding,
    "color": color,
    "text": text,
  };
}
