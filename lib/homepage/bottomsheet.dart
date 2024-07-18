import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic_app/appcolor.dart';
import 'package:islamic_app/provider/AppProvider.dart';
import 'package:provider/provider.dart';
class MyBottomSheetLanguage extends StatelessWidget {

  late AppProvider provider;
  @override
  Widget build(BuildContext context) {
    Map<String,String> languages={
      'en':AppLocalizations.of(context)!.english,
      'ar':AppLocalizations.of(context)!.arabic,
    };
      provider =Provider.of<AppProvider>(context);
    return Container(

      margin: EdgeInsets.all(20),
     child: Column(
       children: [

        InkWell(
             onTap: (){
               if(provider.appLanguage!="en"){
                 Navigator.of(context).pop();
               }
               provider.changeLanguage("en");
             },
            child:provider.appLanguage=="en" ?
            getSelectedItem(AppLocalizations.of(context)!.english)
                :
            getUnSelectedItem(AppLocalizations.of(context)!.english)
        ),
         SizedBox(height: 10,),
         InkWell(
             onTap: (){
               if(provider.appLanguage!="ar"){
                 Navigator.of(context).pop();
               }
                provider.changeLanguage("ar");
             },
             child:provider.appLanguage=='ar'?
             getSelectedItem(AppLocalizations.of(context)!.arabic)
              :
             getUnSelectedItem(AppLocalizations.of(context)!.arabic)
         ),
         SizedBox(height: 10,),
         InkWell(
             onTap: (){
               if(provider.appLanguage!="es"){
                 Navigator.of(context).pop();
               }
               provider.changeLanguage("es");
             },
             child:provider.appLanguage=='es'?
             getSelectedItem(AppLocalizations.of(context)!.spanish)
                 :
             getUnSelectedItem(AppLocalizations.of(context)!.spanish)
         )
       ],
     ),
    );
  }
  Widget getSelectedItem(String text){
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,style:TextStyle(color:
        provider.isDark()?Appcolor.yellowColor:Appcolor.primaryLightColor)),
        Icon(Icons.check,color:
        provider.isDark()?Appcolor.yellowColor:Appcolor.primaryLightColor)
      ],
    );
  }
  Widget getUnSelectedItem(String text){
    return Row(mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(text,style:TextStyle(color: provider.isDark()?
        Appcolor.whiteColor:
        Appcolor.blackColor),)

      ],
    );
  }
}
class MyBottomSheetTheme extends StatelessWidget {

  late AppProvider provider;
  @override
  Widget build(BuildContext context) {

      provider =Provider.of<AppProvider>(context);
    return Container(

      margin: EdgeInsets.all(20),
     child: Column(
       children: [

         InkWell(
             onTap: (){
               if(provider.appTheme!=ThemeMode.light){
                 Navigator.of(context).pop();
               }
              provider.changeTheme(ThemeMode.light);
             },
            child:provider.appTheme==ThemeMode.light ?
            getSelectedItem(AppLocalizations.of(context)!.light)
                :
            getUnSelectedItem(AppLocalizations.of(context)!.light)
        ),
         SizedBox(height: 10,),
         InkWell(
             onTap: (){
               if(provider.appTheme!=ThemeMode.dark){
                 Navigator.of(context).pop();
               }
               provider.changeTheme(ThemeMode.dark);

             },
             child:provider.appTheme==ThemeMode.dark?
             getSelectedItem(AppLocalizations.of(context)!.dart)
              :
             getUnSelectedItem(AppLocalizations.of(context)!.dart)
         ),
       ],
     ),
    );
  }
  Widget getSelectedItem(String text){
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,style:TextStyle(color:
        provider.isDark()?Appcolor.yellowColor:Appcolor.primaryLightColor)),
        Icon(Icons.check,color:
        provider.isDark()?Appcolor.yellowColor:Appcolor.primaryLightColor)
      ],
    );
  }
  Widget getUnSelectedItem(String text){
    return Row(mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(text,style:TextStyle(color: provider.isDark()?
        Appcolor.whiteColor:
        Appcolor.blackColor),)

      ],
    );
  }
}
