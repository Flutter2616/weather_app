import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/view/home_screen.dart';

class Forecastscreen extends StatefulWidget {
  const Forecastscreen({Key? key}) : super(key: key);

  @override
  State<Forecastscreen> createState() => _ForecastscreenState();
}

class _ForecastscreenState extends State<Forecastscreen> {
  @override
  Widget build(BuildContext context) {
    Weathermodel? weather=ModalRoute.of(context)!.settings.arguments as Weathermodel;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30.0, horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(onTap: () {
                      Navigator.pushReplacementNamed(context,'home');
                    },child: Icon(Icons.arrow_back, color: Colors.black, size: 18.sp)),
                    Text("surat,IN",
                        style: GoogleFonts.firaSans(
                            color: Colors.black,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold)),
                    CircleAvatar(
                      backgroundColor: Colors.lightBlue.shade500,
                      child:
                          Icon(Icons.refresh, size: 12.sp, color: Colors.white),
                      radius: 12.sp,
                    ),
                  ],
                ),
              ),
              Container(
                width: 100.w,
                height: 100.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "NEXT 7DAYS",
                              style: GoogleFonts.firaSans(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp),
                            ),
                            Text(
                              "Updated 24m ago",
                              style: GoogleFonts.firaSans(
                                  color: Colors.grey.shade500,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11.sp),
                            ),
                          ],
                        ),
                      ),
                      ExpansionTile(
                        title: Text(
                          "${weather.weather![0].description}",
                          style: GoogleFonts.firaSans(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 10.sp),
                        ),
                        subtitle: Text(
                          "${weather.main!.temp}°c",
                          style: GoogleFonts.tourney(
                            color: Colors.black,
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w100,
                          ),
                        ),

                        leading: Image.asset("${wt!.weathericon}",
                            width: 10.w, height: 10.w, fit: BoxFit.fill),
                        trailing: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Mon",
                                style: GoogleFonts.firaSans(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11.sp),
                              ),
                              Text("17'",
                                  style: GoogleFonts.firaSans(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 11.sp)),
                            ],
                            crossAxisAlignment: CrossAxisAlignment.start),
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Container(
                                  height: 15.h,
                                  width: 15.h,
                                  margin: EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.lightBlue.shade600,
                                      borderRadius: BorderRadius.circular(20)),
                                  padding: EdgeInsets.all(8),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Icon(Icons.cloud_outlined,
                                          size: 20.sp, color: Colors.white),
                                      Text(
                                        "Sunrise",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text("${weather.weather![0].id}",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w600)),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 15.h,
                                  width: 15.h,
                                  margin: EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.lightBlue.shade400,
                                      borderRadius: BorderRadius.circular(20)),
                                  padding: EdgeInsets.all(8),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Icon(Icons.air,
                                          size: 20.sp, color: Colors.white),
                                      Text(
                                        "Wind",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text("${weather.wind!.speed}",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w600)),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 15.h,
                                  width: 15.h,
                                  margin: EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.lightBlue.shade300,
                                      borderRadius: BorderRadius.circular(20)),
                                  padding: EdgeInsets.all(8),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Icon(Icons.cloud_outlined,
                                          size: 20.sp, color: Colors.white),
                                      Text(
                                        "Humanity",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text("${weather.main!.humidity}",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w600)),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 15.h,
                                  width: 15.h,
                                  margin: EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.lightBlue.shade200,
                                      borderRadius: BorderRadius.circular(20)),
                                  padding: EdgeInsets.all(8),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Icon(Icons.compress_outlined,
                                          size: 20.sp, color: Colors.white),
                                      Text(
                                        "Pressure",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text("${weather.main!.pressure}",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w600)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
