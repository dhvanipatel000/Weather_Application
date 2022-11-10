import 'package:flutter/material.dart';
import 'package:weather_app_1/Activities/home.dart';
import 'package:weather_app_1/Activities/loading.dart';
import 'package:weather_app_1/Activities/Choose_location.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      "/" : (context) => Loading(),
      "/home" : (context) => Home(),
      "/loading": (context) => Loading(),
    },
  ));
}

