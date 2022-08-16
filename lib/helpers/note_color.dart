import 'package:flutter/material.dart';

class NoteColors {
  // static const Color backgroudColor = Color(0xFFCEE5D0);
  static const Color titleColor = Color(0xff79B4B7);
  static const Color iconColor = Color(0xff66806A);
  static const Color contentColor = Color(0xffFFBF86);
  //
  static const Color cuttySark = Color(0xff4B7173);
  static const Color springRain = Color(0xffA6DCEF); // Color(0xffA1C5A3);
  static const Color plantation = Color(0xffE36387); //Color(0xff274B4B);
  static const Color mandy = Color(0xffE54F4F);
  static const Color white = Color(0xffFFFFFF);
  static const Color backgroundColor = Color(0xffF6F6F6);
  static const Color blackColor = Color(0xff30475E);

  // static const FontFace

  static const Color hippieBlue = Color(0xff4E7D96);
  static const Color frenchPass = Color(0xff9FC9DD);
  static const Color oysterBay = Color(0xffE3EDF2);
  static const Color coral = Color(0xffFF844B);
  static const Color blackcurrant = Color(0xff0A0D25);
  static const Color cream = Color(0xffFFE3E3);
  static const Color greenLight = Color(0xffF1F7E7);

  static final darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    backgroundColor: const Color(0xFF212121),
    // accentColor: Colors.white,
    // accentIconTheme: IconThemeData(color: Colors.black),
    dividerColor: Colors.black12,
  );

  static final lightTheme = ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.red,
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: coral)
      // visualDensity: VisualDensity(vertical: 0.5, horizontal: 0.5),
      // primarySwatch: MaterialColor(
      //   0xFFF5E0C3,
      //   <int, Color>{
      //     50: Color(0x1aF5E0C3),
      //     100: Color(0xa1F5E0C3),
      //     200: Color(0xaaF5E0C3),
      //     300: Color(0xafF5E0C3),
      //     400: Color(0xffF5E0C3),
      //     500: Color(0xffEDD5B3),
      //     600: Color(0xffDEC29B),
      //     700: Color(0xffC9A87C),
      //     800: Color(0xffB28E5E),
      //     900: Color(0xff936F3E)
      //   },
      // ),
      // primaryColor: oysterBay,
      // // primaryColorBrightness: Brightness.light,
      // primaryColorLight: Color(0x1aF5E0C3),
      // primaryColorDark: Color(0xff936F3E),
      // canvasColor: Color(0xffE09E45),
      // accentColor: Color(0xff457BE0),
      // accentColorBrightness: Brightness.light,
      // scaffoldBackgroundColor: coral,
      // bottomAppBarColor: Color(0xff6D42CE),
      // cardColor: Color(0xaaF5E0C3),
      // dividerColor: Color(0x1f6D42CE),
      // focusColor: Color(0x1aF5E0C3)
      );
}
