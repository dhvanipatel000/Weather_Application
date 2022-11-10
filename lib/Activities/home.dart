import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:weather_icons/weather_icons.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = new TextEditingController();


  @override
  void initState() {
    super.initState();
    print("This is a init state");
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
    print("Set state called");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("Widget Destroyed");
  }

  @override
  Widget build(BuildContext context) {
    var city_name = ["Mumbai", "Delhi", "Chennai", "New York", "Indore", "London"];
    final _random = new Random();
    var city = city_name[_random.nextInt(city_name.length)];
    Map info = {};
    info = ModalRoute.of(context)?.settings?.arguments as Map;
    String temp =  ((info['temp_value']).toString());
    String icon = info['icon_value'];
    String air = ((info['air_speed_value']).toString());
    String feels_Like = ((info['feels_like_value']).toString());
    // String temp_min = ((info['temp_min_value']).toString());
    // String temp_max = ((info['temp_max_value']).toString());
    // String pressure = ((info['pressure_value']).toString());
    if(temp == "NA"){
      print("NA");
    }
    else{
      temp =  ((info['temp_value']).toString()).substring(0,4);
      air = ((info['air_speed_value']).toString()).substring(0,4);
      feels_Like =  ((info['feels_like_value']).toString()).substring(0,4);
      // temp_min = ((info['temp_min_value']).toString()).substring(0, 4);
      // temp_max = ((info['temp_max_value']).toString()).substring(0, 4);
      // pressure = ((info['pressure_value']).toString());
    }
    String hum = info['hum_value'];
    String getcity = info['city_value'];
    String des = info['des_value'];



    //print(icon);
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(0),
      //   child: AppBar(
      //     backgroundColor: Colors.blue,
      //   )
      // ),
      // resizeToAvoidBottomPadding : false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.blueAccent, Colors.white])),
            child: Column(
              children: [
                Container(
                  //Search Container

                  padding: EdgeInsets.symmetric(horizontal: 8),
                  margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24)),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if((searchController.text).replaceAll(" ", "") ==""){
                            print("enter a city");
                          }
                          else{
                            Navigator.pushReplacementNamed(context, "/loading",arguments:{
                              "searchText": searchController.text,
                            });
                          }

                        },
                        child: Container(
                          child: Icon(
                            Icons.search,
                            color: Colors.blueAccent,
                          ),
                          margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: "Search $city"),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white.withOpacity(0.3)),
                          margin: EdgeInsets.symmetric(horizontal: 25),
                          padding: EdgeInsets.all(10),
                          child: Row(children: [
                            Image.network("http://openweathermap.org/img/wn/$icon@2x.png"),
                            SizedBox(width: 20,),
                            Column(
                              children: [
                                Text("$des",style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                ),),
                                Text("in $getcity",style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                ),)
                              ],
                            )
                          ])),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white.withOpacity(0)),
                        margin:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                        padding: EdgeInsets.all(26),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(WeatherIcons.thermometer),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("$temp",style: TextStyle(
                                    fontSize: 90,
                                  color: Colors.white,
                                ),),
                                Text("°C",style: TextStyle(
                                    fontSize: 50,
                                  color: Colors.white,
                                ),)
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white),
                        margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                        padding: EdgeInsets.all(18),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(WeatherIcons.day_windy)
                              ],
                            ),
                            SizedBox(height: 30,)
                            ,
                            Text("$air",style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold
                            ),),
                            Text("km/hr", style: TextStyle(
                              fontSize: 20,
                            ),)
                          ],
                        ),
                        height: 200,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white),
                        margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                        padding: EdgeInsets.all(18),
                        height: 200,
                        child:  Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(WeatherIcons.raindrop)
                              ],
                            ),
                            SizedBox(height: 30,)
                            ,
                            Text("$hum",style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold
                            ),),
                            Text("Percent", style: TextStyle(
                              fontSize: 20,
                            ),)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 75,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white.withOpacity(0.3)),
                        margin:
                        EdgeInsets.symmetric(horizontal: 23, vertical: 10),
                        padding: EdgeInsets.all(23),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Feels like $feels_Like°C" , style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),),
                                // Text("$temp",style: TextStyle(
                                //     fontSize: 25,
                                // ),),
                                // Text("°C",style: TextStyle(
                                //     fontSize: 15,
                                // ),)
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
               /*Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white.withOpacity(0)),
                        margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                        padding: EdgeInsets.all(26),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(WeatherIcons.hot)
                              ],
                            ),
                            SizedBox(height: 30,)
                            ,
                            Text("$temp_min°C",style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),),
                            Text("Miniimum Temp at Day", style: TextStyle(
                              color: Colors.white,
                            ),)
                          ],
                        ),
                        height: 200,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white.withOpacity(0)),
                        margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                        padding: EdgeInsets.all(26),
                        height: 200,
                        child:  Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(WeatherIcons.stars)
                              ],
                            ),
                            SizedBox(height: 30,)
                            ,
                            Text("$temp_max°C",style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),),
                            Text("Minimum Temp at Night", style: TextStyle(
                              color: Colors.white,
                            ),)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 75,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white.withOpacity(0.3)),
                        margin:
                        EdgeInsets.symmetric(horizontal: 23, vertical: 10),
                        padding: EdgeInsets.all(23),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Pressure $pressure mBAR" , style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                                ),),
                                // Text("$temp",style: TextStyle(
                                //     fontSize: 25,
                                // ),),
                                // Text("°C",style: TextStyle(
                                //     fontSize: 15,
                                // ),)
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),*/
                SizedBox(height: 400,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}