import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/view/home_screen.dart';

class Searchscreen extends StatefulWidget {
  const Searchscreen({Key? key}) : super(key: key);

  @override
  State<Searchscreen> createState() => _SearchscreenState();
}

class _SearchscreenState extends State<Searchscreen> {
  @override
  Widget build(BuildContext context) {
    wf = Provider.of<Weatherprovider>(context, listen: false);
    wt = Provider.of<Weatherprovider>(context, listen: true);
    return SafeArea(
      child: Scaffold(backgroundColor: Colors.grey.shade200,
        body: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                  controller: wt!.txtsearch,onChanged: (value) {
                wf!.search_filter(value);
              },
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Icon(Icons.search,
                              size: 12.sp,
                              color: Colors.white),
                          radius: 10.sp,
                        ),
                      ),
                      hintText: "search city",
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius:
                          BorderRadius.circular(20)))),
            ),
            Expanded(child: ListView.builder(itemBuilder: (context, index) {
              return ListTile(onTap: () {
                wf!.on_Selectcity(wt!.filterlist[index]);
                Navigator.pushReplacementNamed(context, '/');
              },tileColor: Colors.white,title: Text("${wt!.filterlist[index].name}"),subtitle: Row(mainAxisSize: MainAxisSize.min,
                children: [
                  Text("lat: ${wt!.filterlist[index].lat}"),
                  SizedBox(width: 5),
                  Text("lon: ${wt!.filterlist[index].lon}"),
                ],
              ),trailing: Icon(Icons.north_east,color: Colors.grey.shade400,size: 18.sp),);
            },itemCount: wt!.filterlist.length,))
          ],
        ),
      ),
    );
  }
}
