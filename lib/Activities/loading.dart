import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_1/Worker/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
//String Temperature = "Loading";
  late String city = "Mumbai";
  late String temp;
  late String hum;
  late String air_speed;
  late String des;
  late String main;
  late String icon;
  late String feels_like;
  // late String temp_min;
  // late String temp_max;
  // late String pressure;
  void startApp(String city) async
  {
    worker instance = worker(location: city);
    await instance.getData();
    // setState(() {
    //   Temperature = instance.temp;
    // });
    temp = instance.temp;
    hum = instance.humidity;
    air_speed = instance.air_speed;
    des = instance.description;
    main = instance.main;
    icon  = instance.icon;
    feels_like = instance.feels_like;
    // temp_min = instance.temp_min;
    // temp_max = instance.temp_max;
    // pressure = instance.pressure;
    Future.delayed(Duration(seconds: 2),() {
      //now throwing the above values to home page i.e home.dart :
      Navigator.pushReplacementNamed(context, '/home' ,arguments: {
        "temp_value" : temp,
        "hum_value" : hum,
        "air_speed_value" : air_speed,
        "des_value" : des,
        "main_value" : main,
        "icon_value": icon,
        "city_value": city,
        "feels_like_value": feels_like,
        // "temp_min_value": temp_min,
        // "temp_max_value": temp_max,
        // "pressure_value": pressure,
        // above mentioned is a map containing key-value pairs
      });
    });

  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Map<String,dynamic>? search = {} ;
    search = ModalRoute.of(context)?.settings?.arguments as Map<String,dynamic>?;

    if(search?.isNotEmpty ?? false){
      city = search?['searchText'];
    }
    startApp(city);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("images/logo2.png", height: 240,width: 240,),
            Text("WeatherLens",
              style: GoogleFonts.anton(
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                  color: Colors.black
              ),
            ),
            SpinKitCircle(
              color: Colors.blue,
              size: 50.0,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}












































