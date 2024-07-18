import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:islamic_app/homepage/homePage.dart';
import 'package:islamic_app/homepage/quran/sura_details.dart';
import 'package:islamic_app/my_theme_data.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic_app/provider/AppProvider.dart';
import 'homepage/hadeth/hadeth_details.dart';
import 'package:provider/provider.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context)=>AppProvider(),
      child: MyApp()));
}
class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppProvider>(context);
    return MaterialApp(
      theme: MyThemeData.myThemeLight,
      debugShowCheckedModeBanner: false,
      initialRoute:HomePage.routeName ,
      routes: { HomePage.routeName:(context)=>HomePage(),
        SuraDetails.routeName:(context)=>SuraDetails(),
        HadethDetails.routeName:(context)=>HadethDetails(),
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale:Locale(provider.appLanguage),
      themeMode:provider.appTheme,
      darkTheme: MyThemeData.myThemeDark,
    );
  }
}
