import 'package:cash/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/provider.dart';

class ButtonsWidget extends StatefulWidget {
  const ButtonsWidget({Key? key}) : super(key: key);

  @override
  State<ButtonsWidget> createState() => _ButtonsWidgetState();
}

class _ButtonsWidgetState extends State<ButtonsWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(right: size.width * .05, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xffff6666)),
              onPressed: () {
                _dialogBuilder(
                  context,
                  LocaleKeys.spend.tr(),
                  true,
                  () => setState(() {}),
                );
              },
              child: Text(
                LocaleKeys.spend.tr(),
                style: TextStyle(letterSpacing: 3, color: Colors.white, fontWeight: context.locale == const Locale('ru') ? FontWeight.w600 : null),
              )),
          SizedBox(
            width: size.width * .05,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xff6cf068)),
              onPressed: () {
                _dialogBuilder(
                  context,
                  LocaleKeys.insert.tr(),
                  false,
                  () => setState(() {}),
                );
              },
              child: Text(
                LocaleKeys.insert.tr(),
                style: TextStyle(letterSpacing: 3, fontWeight: context.locale == const Locale('ru') ? FontWeight.w600 : null),
              ))
        ],
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context, String text, bool isSpend, VoidCallback callback) {
    final prov = Provider.of<TransferProvider>(context, listen: false);
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        final size = MediaQuery.of(context).size;

        return AlertDialog(
          elevation: 0,
          backgroundColor: Colors.black45,
          title: Text(
            context.locale == const Locale('uz') ? '${LocaleKeys.minutes.tr()} $text' : '$text ${LocaleKeys.minutes.tr()}',
            style: const TextStyle(color: Colors.white, letterSpacing: 3),
          ),
          content: SizedBox(
            height: size.height * .05,
            child: TextFormField(
              controller: prov.controller,
              style: const TextStyle(height: 1),
              autofocus: true,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(12),
                isDense: true,
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 2.0),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                filled: true,
              ),
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: Text(
                text,
                style: const TextStyle(letterSpacing: 3),
              ),
              onPressed: () {
                if (!isSpend) {
                  // controller.text != '' ? prov.insertMinutes(int.parse(controller.text)) : null;
                  prov.addTransfer(context, true, int.parse(prov.controller.text));
                } else {
                  // controller.text != '' ? prov.spendMinutes(int.parse(controller.text)) : null;
                  prov.addTransfer(context, false, int.parse(prov.controller.text));
                }
                callback;
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    ).then((value) => prov.controller.clear());
  }
}
