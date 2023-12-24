import 'package:cash/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../database/hive_box.dart';
import '../database/transfer_data.dart';
import '../home_page.dart';

class Transfers {
  final String title;
  final String cost;

  Transfers({required this.title, required this.cost});
}

class TransferProvider extends ChangeNotifier {
  int minutes = 10504800;

  TextEditingController controller = TextEditingController();

  double hoursDouble() {
    return minutes / 60;
  }

  String hours() {
    return hoursDouble().toInt().toString();
  }

  double daysDouble() {
    return hoursDouble() / 24;
  }

  String days() {
    return daysDouble().toInt().toString();
  }

  double monthsDouble() {
    return daysDouble() / 30;
  }

  String months() {
    return monthsDouble().toInt().toString();
  }

  double yearsDouble() {
    return monthsDouble() / 12;
  }

  String years() {
    return yearsDouble().toInt().toString();
  }




  Future<void> addTransfer(BuildContext  context, bool  isIncome, int val, ) async{

    !isIncome ? minutes -= val : minutes += val;

    await HiveBox.transfers.add(TransferData(isIncome: isIncome, transCost: val, )).then((value) async{
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setInt('minutes', minutes);
    });


    notifyListeners();
  }

  initialize() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    minutes = prefs.getInt('minutes')!;
    notifyListeners();
  }

  transferList(){
    return [
      LocaleKeys.spended.tr(),
      LocaleKeys.incomed.tr(),
    ];
  }


   choiceAction(String choice, BuildContext context) {
    if (choice == Constants.english) {
      // AppLocalizations.delegate.load(locale)
      context.setLocale(const Locale('en'));
    } else if (choice == Constants.russian) {
      context.setLocale(const Locale('ru'));
    } else if (choice == Constants.uzbek) {
      context.setLocale(const Locale('uz'));
    }

    notifyListeners();
  }




}
