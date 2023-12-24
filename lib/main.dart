import 'package:cash/utils/colors.dart';
import 'package:cash/utils/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'database/transfer_data.dart';
import 'generated/codegen_loader.g.dart';
import 'home_page.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  initializeDateFormatting();
  await Hive.initFlutter();
  Hive.registerAdapter(TransferDataAdapter());
  await Hive.openBox<TransferData>('transfers');

  runApp(ChangeNotifierProvider(
      create: (context) => TransferProvider(),
      child: EasyLocalization(
          supportedLocales: const[
            Locale('en'),
            Locale('ru'),
            Locale('uz'),
          ],
          fallbackLocale: const Locale('ru'),
          path: 'assets/translations',
          assetLoader: const CodegenLoader(),
          child: const MyApp())));
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      theme: ThemeData(
        fontFamily: 'hacking',
        useMaterial3: true,
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.blueGrey,
            titleTextStyle: TextStyle(color: AppColors.textColor, fontSize: 25,fontFamily: 'hacking', fontWeight:  FontWeight.w500, letterSpacing: 5)),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple).copyWith(background: Colors.blueGrey),
      ),
      home: const HomePage(),
    );
  }
}
// for hive
// flutter packages pub run build_runner build --delete-conflicting-outputs


// flutter pub run easy_localization:generate -S "assets/translations"
// flutter pub run easy_localization:generate -f keys -o locale_keys.g.dart -S "assets/translations"