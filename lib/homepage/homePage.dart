import 'package:flutter/material.dart';
import 'package:islamic_app/homepage/hadeth/hadethtap.dart';
import 'package:islamic_app/homepage/quran/qurantap.dart';
import 'package:islamic_app/homepage/radio_tap/radio_tap_view.dart';
import 'package:islamic_app/homepage/sebhatap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic_app/homepage/setting_tab.dart';
import 'package:islamic_app/provider/AppProvider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const String routeName ='homepage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
int selecteditem=0;
List<Widget> hometap=[
  QuranTap(),HadethTap(),SebhaTap(),RadioTapView(),SettingTab()
];

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppProvider>(context);
    return Stack(
      children:[
       provider.isDark()?
       Image.asset("assets/images/background_dark.png",
         width: double.infinity,
         height: double.infinity,
         fit: BoxFit.fill,
       )
        :
    Image.asset("assets/images/background.png",
    width: double.infinity,
    height: double.infinity,
    fit: BoxFit.fill,
    ),
        Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.app_title),
          ),
          body: hometap[selecteditem],
          bottomNavigationBar:Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Theme.of(context).primaryColor
            ),
            child: BottomNavigationBar(
              currentIndex: selecteditem,
              onTap: (value) {
                selecteditem=value;
                setState(() {

                });
              },
              items: [
                BottomNavigationBarItem(

                  icon: ImageIcon(AssetImage('assets/images/quran_icon.png')),
                    label: AppLocalizations.of(context)!.quran,

                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/hadeth_icon.png')),
                    label:AppLocalizations.of(context)!.hadeth,
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/sebha_icon.png')),
                    label: AppLocalizations.of(context)!.sehba,
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/radio_icon.png')),
                    label: AppLocalizations.of(context)!.radio,
                ),
                BottomNavigationBarItem(
                  icon:Icon(Icons.settings),
                  label: AppLocalizations.of(context)!.settings,
                ),
              ],

            ),
          ) ,
        )
      ]
    );
  }
}
