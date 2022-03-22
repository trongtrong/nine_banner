library nine_banner;

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A Calculator.
class NineBanner {
  static bool isTest = false;

  static Future<String> loadBanner(String inventory, Function callBack) async {
    await Future.delayed(const Duration(seconds: 6));
    isTest = true;
    callBack();
    return 'test banner';
  }

  static Future<void> readJson(BuildContext context) async {
    final String response = await rootBundle.loadString("packages/nine_banner/assets/test/banner.json");
    // final String response = await DefaultAssetBundle.of(context).loadString('assets/test/banner.json');
    final data = await json.decode(response);
    print('Data ==    ${data}');
    // ...
  }
}
