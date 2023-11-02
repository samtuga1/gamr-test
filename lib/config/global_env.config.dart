import 'dart:convert';

import 'package:flutter/services.dart';

class GlobalConfiguration {
  GlobalConfiguration._internal();

  static final GlobalConfiguration _singleton = GlobalConfiguration._internal();

  factory GlobalConfiguration() => _singleton;

  Map<String, dynamic> appConfig = {};

  Future<GlobalConfiguration> loadFromAsset(String envConfig) async {
    //load json configuration from asset
    String content = await rootBundle.loadString('assets/cfg/$envConfig.json');
    Map<String, dynamic> configMap = jsonDecode(content);
    appConfig.addAll(configMap);

    return _singleton;
  }
}
