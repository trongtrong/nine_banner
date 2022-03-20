library nine_banner;

/// A Calculator.
class NineBanner {
  static bool isTest = false;
  static Future<String> loadBanner(String inventory, Function callBack) async {
    await Future.delayed(const Duration(seconds: 6));
    isTest = true;
    callBack();
    return 'test banner';
  }
}
