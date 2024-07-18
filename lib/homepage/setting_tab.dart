import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic_app/appcolor.dart';
import 'package:islamic_app/homepage/bottomsheet.dart';
import 'package:islamic_app/provider/AppProvider.dart';
import 'package:provider/provider.dart';
class SettingTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Map<String,String> languages={
      'en':AppLocalizations.of(context)!.english,
      'ar':AppLocalizations.of(context)!.arabic,
      'es':AppLocalizations.of(context)!.spanish
    };
    var provider =Provider.of<AppProvider>(context);
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.language,style:Theme.of(context).textTheme.bodyLarge),
          SizedBox(height: 15,),
          Container(
            decoration: provider.isDark()?
            BoxDecoration(
                color: Appcolor.yellowColor,
                borderRadius: BorderRadius.circular(25)
            ):
            BoxDecoration(
                color: Appcolor.primaryLightColor,
                borderRadius: BorderRadius.circular(25)
            ),
            padding: EdgeInsets.all(10),
            child: InkWell(
              onTap: (){
                showModalBottomSheet(
                    context: context,
                    builder:(context)=>MyBottomSheetLanguage()
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(languages[provider.appLanguage]!
                  ),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
            ),
          ),
          SizedBox(height: 20,),
          Text(AppLocalizations.of(context)!.theme,style:Theme.of(context).textTheme.bodyLarge),
          SizedBox(height: 15,),
          Container(
            decoration: provider.isDark()?
            BoxDecoration(
                color: Appcolor.yellowColor,
                borderRadius: BorderRadius.circular(25)
            ):
            BoxDecoration(
                color: Appcolor.primaryLightColor,
                borderRadius: BorderRadius.circular(25)
            ),
            padding: EdgeInsets.all(10),
            child: InkWell(
              onTap: (){
                showModalBottomSheet(
                    context: context,
                    builder:(context)=>MyBottomSheetTheme()
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(provider.isDark()?
                  AppLocalizations.of(context)!.dart
                      :
                  AppLocalizations.of(context)!.light
                  ),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

}
