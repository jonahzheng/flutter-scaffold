import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:MoFangXiu/common/lng/LngString.dart';
import 'package:MoFangXiu/common/lng/LngEn.dart';
import 'package:MoFangXiu/common/lng/LngZh.dart';

///自定义多语言实现
class MyLocalizations {
  final Locale locale;

  MyLocalizations(this.locale);

  ///根据不同 locale.languageCode 加载不同语言对应
  static Map<String, LngString> _localizedValues = {
    'en': new LngEn(),
    'zh': new LngZh(),
  };

  LngString get currentLocalized {
    return _localizedValues[locale.languageCode];
  }

  ///通过 Localizations 加载当前的 MyLocalizations
  ///获取对应的 StringBase
  static MyLocalizations of(BuildContext context) {
    return Localizations.of(context, MyLocalizations);
  }
}
