// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const brightness = Brightness.light;

const secondaryColor = Color.fromARGB(255, 76, 175, 80);
//const secondaryColor = Color(0xFF595959);
const primaryColor = Color.fromARGB(255, 165, 214, 167);
//const primaryColor = const Color(0xFF1E6BEB);
const grayColor = Color(0xFFC4C4C4);
const textColor = Color(0xFF172B4D);
const orangeColor = Color(0xFFFF912B);
const icoGreyColor = Color(0xFFC2CFE0);
const borderColor = Color(0xFFACB2BF);

ThemeData appTheme() {
  return ThemeData(
      primarySwatch: MaterialColor(
        0xFF23287A,
        <int, Color>{
          50: Color(0x1aF5E0C3),
          100: Color(0xa1F5E0C3),
          200: Color(0xaaF5E0C3),
          300: Color(0xafF5E0C3),
          400: Color(0xffF5E0C3),
          500: Color(0xffEDD5B3),
          600: Color(0xffDEC29B),
          700: Color(0xffC9A87C),
          800: Color(0xffB28E5E),
          900: Color(0xff936F3E)
        },
      ),
      textTheme: TextTheme(
        bodyText1:
            GoogleFonts.robotoTextTheme().bodyText1?.copyWith(fontSize: 34),
        bodyText2:
            GoogleFonts.robotoTextTheme().bodyText1?.copyWith(fontSize: 24),
        headline1: GoogleFonts.robotoTextTheme()
            .headline2
            ?.copyWith(color: textColor, fontSize: 22),
        headline2: GoogleFonts.robotoTextTheme()
            .headline2
            ?.copyWith(color: textColor, fontSize: 20),
        headline3: GoogleFonts.robotoTextTheme()
            .headline2
            ?.copyWith(color: textColor, fontSize: 16),
        headline4: GoogleFonts.robotoTextTheme()
            .headline2
            ?.copyWith(color: textColor, fontSize: 14),
        headline5: GoogleFonts.robotoTextTheme()
            .headline2
            ?.copyWith(color: textColor, fontSize: 12),
      ),
      primaryColor: primaryColor,
      scaffoldBackgroundColor: primaryColor,
      dividerColor: Color(0x1f6D42CE),
      focusColor: Color(0xFF2F2E41),
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Color(0xFF5E6C84)),
        color: Colors.transparent,
        elevation: 0,
      ));
}
