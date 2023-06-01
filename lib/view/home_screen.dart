import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/model/city_model.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/provider/weather_provider.dart';

Weatherprovider? wf;
Weatherprovider? wt;

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    wf = Provider.of<Weatherprovider>(context, listen: false);
    wt = Provider.of<Weatherprovider>(context, listen: true);

    return SafeArea(
      child: Scaffold(
          body: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            Weathermodel weather = snapshot.data!;
            wf!.change_image(weather.main!.temp,weather.weather![0].description);
            return SingleChildScrollView(
              child: Container(
                width: 100.w,
                height: 100.h,
                decoration: BoxDecoration(
                  color: Colors.blue.shade200,
                  image: DecorationImage(
                      image: AssetImage("assets/image/bg.jpg"),
                      fit: BoxFit.cover,
                      opacity: 100),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                              controller: wt!.txtsearch,
                              onChanged: (value) {
                                wf!.search_filter(value);
                              },
                              onTap: () {
                                Navigator.pushNamed(context, 'search');
                              },
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.blue,
                                      child: Icon(Icons.search,
                                          size: 12.sp, color: Colors.white),
                                      radius: 10.sp,
                                    ),
                                  ),
                                  hintText: "search city",
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius:
                                          BorderRadius.circular(20)))),
                          SizedBox(height: 15),
                          Text("${wt!.selectcity}",
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.firaSans(
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  letterSpacing: 1)),
                          Text("India",
                              style: GoogleFonts.poppins(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  letterSpacing: 1)),
                        ],
                      ),
                    ),
                    SizedBox(height: 25),
                    Image.asset("${wt!.weathericon}",width: 50.w,height: 50.w,fit: BoxFit.fill),
                    Spacer(),
                    Container(
                      width: 100.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(30))),
                      padding: EdgeInsets.all(25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Updated 12 mins ago",
                              style: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w500)),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${weather.weather![0].main}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 25.sp,
                                    color: Colors.black),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "sun",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10.sp,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    "16'",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 11.sp,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Stack(
                            alignment: Alignment(1.1, 1.4),
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "${weather.main!.temp!.toInt()}°c",
                                    style: GoogleFonts.tourney(
                                      color: Colors.black,
                                      fontSize: 70.sp,
                                      fontWeight: FontWeight.w100,
                                    ),
                                  ),
                                  // Image.asset("${wt!.weathericon}",
                                  //     alignment: Alignment.bottomCenter,
                                  //     width: 18.w,
                                  //     height: 18.w,
                                  //     fit: BoxFit.fill),
                                ],
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, 'forecast',arguments: weather);
                                  },
                                  child: Text("Tap for more",
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 10.sp,
                                          color: Colors.blue))),
                            ],
                          ),
                          SizedBox(height: 20),
                          Divider(
                              color: Colors.grey.shade300,
                              thickness: 1,
                              height: 1),
                          SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 4.h,
                                alignment: Alignment.center,
                                width: 20.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: Colors.grey.shade400)),
                                child: Text("Home",
                                    style: TextStyle(
                                        color: Colors.grey.shade400,
                                        fontSize: 8.sp,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 1)),
                              ),
                              Spacer(),
                              Container(
                                  height: 8.w,
                                  alignment: Alignment.center,
                                  width: 8.w,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Colors.grey.shade400)),
                                  child: Icon(Icons.settings_outlined,
                                      size: 15.sp,
                                      color: Colors.grey.shade400)),
                              SizedBox(width: 10),
                              CircleAvatar(
                                backgroundColor: Colors.blue.shade500,
                                child: Icon(Icons.refresh,
                                    size: 12.sp, color: Colors.white),
                                radius: 12.sp,
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
        future: wf!.weatherapi_calling(wt!.selectlan, wt!.selectlan),
      )),
    );
  }
}
