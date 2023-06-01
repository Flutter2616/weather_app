import 'package:flutter/material.dart';
import 'package:weather_app/model/city_model.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/utils/api_helper.dart';

class Weatherprovider extends ChangeNotifier
{

  TextEditingController txtsearch=TextEditingController();
String selectcity="surat";
String selectlan="21.1702";
String selectlon="72.8311";

String weathericon='';

  Weathermodel? weather;
  List<Citymodel> cityname=[
    Citymodel(name: "Surat",lat: "21.1702",lon: "72.8311"),
    Citymodel(name: "Ahmadabad",lat: "23.0225",lon: "72.5714"),
    Citymodel(name: "Mumbai",lat: "19.0760",lon: "72.8777"),
    Citymodel(name: "Rajashthan",lat: "27.0238",lon: "74.2179"),
    Citymodel(name: "Haryana",lat: "29.0588",lon: "76.0856"),
    Citymodel(name: "Punjab",lat: "31.1471",lon: "75.3412"),
    Citymodel(name: "Utter Pradesh",lat: "27.5706",lon: "80.0982"),
    Citymodel(name: "Madhay Pradesh",lat: "22.9734",lon: "78.6569"),
    Citymodel(name: "Tamil nadu",lat: "11.1271",lon: "78.6569"),
    Citymodel(name: "Kerala",lat: "10.1632",lon: "76.6413"),
    Citymodel(name: "Kashmir",lat: "33.2778",lon: "75.3412"),
    Citymodel(name: "Kolkata",lat: "22.5726",lon: "88.3639"),
    Citymodel(name: "Delhi",lat: "28.7041",lon: "77.1025"),
  ];
  List<Citymodel> filterlist=[];
  List<Citymodel> searchlist=[];
  Future<Weathermodel?> weatherapi_calling(String lat, String lon)
  async {
    weather=await Apihelper.apihelper.Weather_api(lat,lon);
    return weather;

  }

  void change_image(double? temp,String? desc)
  {
    if(temp!<=30&&desc=="Cloud")
      {
        weathericon='assets/image/cloud.png';
      }
    else if(temp<=30&&desc=="Rain")
      {
        weathericon='assets/image/rain.png';
      }
    else if(desc=="Sunny"||temp>30)
      {
        weathericon='assets/image/sunicon.png';
      }
    else
      {
        weathericon='assets/image/suncloud.png';
      }

  }

  void search_filter(String value)
  {
    if(value.isEmpty)
      {
        filterlist=cityname;
      }
    else
      {
        searchlist.clear();
        for(var city in cityname)
          {
            if(city.name!.toLowerCase().contains(value.toLowerCase()))
              {
                searchlist.add(city);
              }
          }
        filterlist=searchlist;
      }
    notifyListeners();
  }



  void on_Selectcity(Citymodel city)
  {
    selectcity=city.name!;
    selectlan=city.lat!;
    selectlon=city.lon!;
    notifyListeners();
  }

}