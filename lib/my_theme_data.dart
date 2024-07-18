import 'package:flutter/material.dart';
import 'package:islamic_app/appcolor.dart';

class MyThemeData {
  static final ThemeData myThemeLight =ThemeData(
    primaryColor: Appcolor.primaryLightColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Appcolor.blackColor
      ),
      titleTextStyle: TextStyle(
        fontSize:25,
        fontWeight:  FontWeight.bold,
        color: Appcolor.blackColor,
      )

    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Appcolor.primaryLightColor,
      showUnselectedLabels: true,
      selectedItemColor: Appcolor.blackColor,

    ),
    bottomSheetTheme:BottomSheetThemeData(
        backgroundColor: Appcolor.whiteColor
    ),

    textTheme: TextTheme(

      bodyLarge:TextStyle(
        fontSize: 19,
        fontWeight:FontWeight.w600,

      ),
      bodyMedium:TextStyle(
        fontSize: 15,
        fontWeight:FontWeight.bold,

      ),
    ),

  );
  static final ThemeData myThemeDark =ThemeData(
    primaryColor: Appcolor.primaryDarkColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
        iconTheme: IconThemeData(
            color: Appcolor.whiteColor
        ),
      titleTextStyle: TextStyle(
        fontSize:25,
        fontWeight:  FontWeight.bold,
        color: Appcolor.whiteColor,
      )

    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Appcolor.primaryDarkColor,
      showUnselectedLabels: true,
      selectedItemColor: Appcolor.yellowColor,

    ),
    bottomSheetTheme:BottomSheetThemeData(
      backgroundColor: Appcolor.primaryDarkColor
    ),

    textTheme: TextTheme(

      bodyLarge:TextStyle(
        fontSize: 19,
        fontWeight:FontWeight.w600,
        color: Appcolor.whiteColor

      ),
      bodyMedium:TextStyle(
        fontSize: 15,
        fontWeight:FontWeight.bold,
        color: Appcolor.whiteColor
      ),
    ),

  );
}