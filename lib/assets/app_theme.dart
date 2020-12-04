import 'package:flutter/material.dart';

enum AppTheme { BlueLight, BlueDark }

final appThemeData = {
  AppTheme.BlueLight: ThemeData(
    primaryColor: Colors.lightBlue,
    textTheme: TextTheme(bodyText1: TextStyle(color: Colors.black38)),
  ),
  AppTheme.BlueDark: ThemeData(
    primaryColor: Colors.blue[900],
    textTheme: TextTheme(bodyText1: TextStyle(color: Colors.cyan[300])),
  )
};
