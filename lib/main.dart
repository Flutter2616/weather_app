import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/view/forecast_screen.dart';
import 'package:weather_app/view/home_screen.dart';
import 'package:weather_app/view/search_screen.dart';
import 'package:weather_app/view/splash_screen.dart';

void main() {
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => Weatherprovider()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            routes: {
              '/': (context) => Splashscreen(),
              'home': (context) => Homescreen(),
              'forecast': (context) => Forecastscreen(),
              'search': (context) => Searchscreen(),
            },
          ),
        );
      },
    ),
  );
}
