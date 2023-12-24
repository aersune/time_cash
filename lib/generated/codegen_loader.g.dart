// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "years": "Years",
  "months": "Months",
  "days": "Days",
  "insert": "Insert",
  "spend": "Spend",
  "minutes": "Minutes",
  "your_minutes": "Your minutes",
  "number_card": "Card Number",
  "incomed": "Incomed",
  "spended": "Spended"
};
static const Map<String,dynamic> ru = {
  "years": "Годы",
  "months": "Месяцы",
  "days": "Дни",
  "insert": "Принять",
  "spend": "Тратить",
  "minutes": "Минуты",
  "your_minutes": "Ваши минуты",
  "number_card": "Номер карты",
  "incomed": "Получень",
  "spended": "Потрачено"
};
static const Map<String,dynamic> uz = {
  "years": "Yil",
  "months": "Oy",
  "days": "Kun",
  "insert": "Kiritish",
  "spend": "Sarflash",
  "minutes": "Daqiqa",
  "your_minutes": "Sizning daqiqalaringiz",
  "number_card": "Karta Raqami",
  "incomed": "Qabul qilindi",
  "spended": "Sarflandi"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "ru": ru, "uz": uz};
}
