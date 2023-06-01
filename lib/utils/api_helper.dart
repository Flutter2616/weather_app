import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather_model.dart';

class Apihelper {
  static Apihelper apihelper = Apihelper();

  Future<Weathermodel> Weather_api(String lat,String lon) async {
    String link =
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=6e2a97e08f38f6d24bc52bc3f1a5c97a&units=metric';
    var response = await http.get(Uri.parse(link));

    var json = jsonDecode(response.body);

    return Weathermodel.fromJson(json);
  }
}
