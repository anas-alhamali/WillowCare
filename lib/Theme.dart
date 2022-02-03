import 'package:flutter/material.dart';

String appTitle = 'Willow Care App';

Color foreColor = Color(0xff52b1e4);
Color backColor = Color(0xfff6f6f6);
Color hardColor = Color(0xff0f5699);
Color selectedColor = Color(0xff030835);
Color softColor = Color(0xffe2e3ed);
const Color ErrorColor = Colors.red;
Color? textHeaderColor = Color(0xff151534);
Color? textColor = Color(0xff151534);
double appVersion = 1.0;
final ThemeData myTheme = ThemeData(
    canvasColor: backColor,
    fontFamily: 'ShareTech',
    primaryColor: foreColor,
    backgroundColor: backColor,
    textTheme: TextTheme(
      headline5: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
      headline6: TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
      headline4: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.italic),
      button: TextStyle(
          fontSize: 20, color: textColor, fontWeight: FontWeight.w700),
      //body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    ),
    //fontFamily: 'Schyler',
    colorScheme: ColorScheme.light(
      onSurface: Colors.grey,
    ));
var stndErrorMsg =
    "Failed host lookup! check your internet connection or call support service.";

var MyBoxDecoration = BoxDecoration(
    gradient: LinearGradient(
        colors: [
          Colors.white.withOpacity(0.1),
          //Color.fromRGBO(0, 0, 0, 0.6)
          Colors.grey.withOpacity(0.7),
        ],
        begin: FractionalOffset.topCenter,
        end: FractionalOffset.bottomCenter,
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp));

class MMTextStyle extends TextStyle {
  const MMTextStyle(
      {double fontSize = 12.0,
      FontWeight? fontWeight,
      Color color = Colors.black87,
      double? letterSpacing,
      double? height,
      String? fontFamily})
      : super(
          inherit: false,
          color: color,
          fontFamily: fontFamily,
          fontSize: fontSize,
          fontWeight: fontWeight,
          textBaseline: TextBaseline.alphabetic,
          letterSpacing: letterSpacing,
          height: height,
        );
}

final TextStyle titleStyle = const MMTextStyle(fontSize: 34.0);

final TextStyle headingStyle = const MMTextStyle(
    fontSize: 20.0, fontWeight: FontWeight.bold, height: 24.0 / 15.0);

class CustomTheme {
  static ThemeData get lightTheme {
    //1
    return ThemeData(
        //2
        primaryColor: foreColor,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'ShareTech', //3
        buttonTheme: ButtonThemeData(
          // 4
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: hardColor,
        ));
  }
}
