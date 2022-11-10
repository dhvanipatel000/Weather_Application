import 'package:http/http.dart';
import 'dart:convert';



//class -different, methods
/*instance - instances can be different but the properties are same so we can
fetch different data*/

class worker
{

  late String location;

  //Constructor
  worker({required this.location})
  {
    location = this.location;
  }



  late String temp;
  late String humidity;
  late String air_speed;
  late String description;
  late String main;
  late String icon;
  late String feels_like;
  // late String temp_min;
  // late String temp_max;
  // late String pressure;

  //method => method will help us fetch info based on location.

  Future<void>getData() async
  {
    try{
      Response response = await get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$location&appid=f3f9aa1b33cc42a3eb7d2116ff1a77a7'));
      Map data = jsonDecode(response.body);

      print(data);
      //G = Getting Temp, Humidity.
      Map temp_data = data['main'];
      String getHumidity = temp_data['humidity'].toString();
      double getTemp = temp_data['temp'] - 273.15;
      double getfeels_like = temp_data['feels_like'] - 273.15;
      // double gettemp_min = temp_data['temp_min'] - 273.15;
      // double gettemp_max = temp_data['temp_max'] - 273.15;
      // double getpressure = temp_data['pressure'];


      //Getting Air speed
      Map wind = data['wind'];
      double getAir_speed = wind['speed']/0.27777777777778;


      //Getting Description
      List weather_data = data['weather'];
      Map weather_main_data = weather_data[0];
      String getMain_des = weather_main_data['description'];
      String getDesc = weather_main_data['description'];
      icon = weather_main_data["icon"].toString();
      print(icon);


      //Assigning Values
      temp = getTemp.toString(); // in celcius
      humidity = getHumidity; // in %
      air_speed = getAir_speed.toString(); // in km/hr
      description = getDesc; //string
      main = getMain_des; //string
      feels_like = getfeels_like.toString(); //string
      // temp_min = gettemp_min.toString(); //string
      // temp_max = gettemp_max.toString(); //string
      // pressure = getpressure.toString();




      //Catch block for try method.
      /*catch block will help us to show result error when try block fails to
      give us results from the API.
      this catch block will show ERROR (Couldn't find Data) and will suggest to
      enter valid city.
      */
    }catch(e)
    {
      temp = "Couldn't find Data. Please enter Valid City.";
      humidity = "Couldn't find Data";
      air_speed = "Couldn't find Data";
      description = "Couldn't find Data";
      main = "Couldn't find Data";
      feels_like = "Couldn't find Data";
      // temp_min = "Couldn't find Data";
      // temp_max = "Couldn't find Data";
      // pressure = "Couldn't find Data";
    }





  }



}
















