import 'package:cash/utils/provider.dart';
import 'package:cash/widgets/buttons_widget.dart';
import 'package:cash/widgets/card_widget.dart';
import 'package:cash/widgets/transfers_builder.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    initialization();
    Provider.of<TransferProvider>(context, listen: false).initialize();

  }

  void initialization() async {
      await Future.delayed(const Duration(milliseconds: 200)).then((value) => FlutterNativeSplash.remove());

  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final prov = Provider.of<TransferProvider>(context, listen: false);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text('Time Cash'), centerTitle: true, actions: [
        PopupMenuButton<String>(
            icon: const Icon(
              CupertinoIcons.ellipsis_vertical,
              color: Colors.white,
            ),
            onSelected: (String choice) {
              prov.choiceAction(choice, context);
              setState(() {});
              // choiceAction(choice, context);
            },
            itemBuilder: (BuildContext context) {
              return Constants.choices.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(
                    choice,
                    style: const TextStyle(fontFamily: 'roboto'),
                  ),
                );
              }).toList();
            })
      ]),
      body: SizedBox(
        height: size.height,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CardWidget(),
            TransfersBuilder(),
            SizedBox(
              height: 90,
            )
            // ButtonsWidget(),
          ],
        ),
      ),
      floatingActionButton: const ButtonsWidget(),
    );
  }
}

class Constants {
  static const String english = 'English';
  static const String russian = 'Русский';
  static const String uzbek = "O'zbekcha";

  static const List<String> choices = <String>[
    english,
    russian,
    uzbek,
  ];
}

void choiceAction(String choice, BuildContext context) {
  if (choice == Constants.english) {
    // AppLocalizations.delegate.load(locale)
    context.setLocale(const Locale('en'));
  } else if (choice == Constants.russian) {
    context.setLocale(const Locale('ru'));
  } else if (choice == Constants.uzbek) {
    context.setLocale(const Locale('uz'));
  }
}
