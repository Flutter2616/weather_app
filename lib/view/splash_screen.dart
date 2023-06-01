import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3),() {
      Navigator.pushReplacementNamed(context, 'home');
    },);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 50.w,
                  width: 50.w,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child:
                          Image.asset("assets/image/logo.png", fit: BoxFit.fill))),
              SizedBox(height: 10),
              Text("Weather",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w600,fontSize: 30.sp)),
            ],
          ),
        ),
      ),
    );
  }
}
