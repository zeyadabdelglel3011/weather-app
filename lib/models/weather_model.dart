import 'package:flutter/material.dart';

class WeatherModel
{
   String? date;
   double? temp;
   double? maxTemp;
   double? minTemp;
   String? weatherStateName;

  WeatherModel({required this.date, required this.temp, required this.maxTemp,required this.minTemp,required this.weatherStateName});


  factory WeatherModel.formJson(dynamic data)
  {
    var jsonData = data['forecast']['forecastday'][0]['day'];

    return WeatherModel(date: data['location']['localtime'], temp:  jsonData['avgtemp_c'], maxTemp: jsonData['maxtemp_c'], minTemp: jsonData['mintemp_c'], weatherStateName:jsonData["condition"]['text'] );

  }

  @override
  String toString() {

    return 'temp = $temp minTemp = $minTemp date = $date';
  }


  String getImage(){
    if(weatherStateName == 'Clear' || weatherStateName == ' Light Cloud'){
      return 'assets/clear.png';
    }
   else if(weatherStateName == 'Sleet' || weatherStateName == ' Snow' || weatherStateName == 'Hail' || weatherStateName == 'Patchy rain nearby'){
      return 'assets/snow.png';
    }
    else if(weatherStateName == 'Heavy Cloud' || weatherStateName == 'Partly Cloudy'){
      return 'assets/cloudy.png';
    }
    else if(weatherStateName == 'Light Rain' || weatherStateName == ' Heavy Rain' || weatherStateName == 'Showers' || weatherStateName == 'Moderate rain' ){
      return 'assets/rainy.png';
    }
    if(weatherStateName == 'Sunny' ) {
      return 'assets/clear.png' ;
    }

    if(weatherStateName == 'Thunderstorm' || weatherStateName == 'Thunder'){
      return 'assets/thunderstorm.png';
    }else {
      return 'assets/clear.png';
    }

  }


   MaterialColor getThemeColor(){
     if(weatherStateName == 'Clear' || weatherStateName == ' Light Cloud'){
       return Colors.orange;
     }
     else if(weatherStateName == 'Sleet' || weatherStateName == ' Snow' || weatherStateName == 'Hail' || weatherStateName == 'Patchy rain nearby'){
       return Colors.indigo;
     }
     else if(weatherStateName == 'Heavy Cloud' || weatherStateName == 'Partly Cloudy'){
       return Colors.cyan;
     }
     else if(weatherStateName == 'Light Rain' || weatherStateName == ' Heavy Rain' || weatherStateName == 'Showers' ||  weatherStateName == 'Moderate rain' ){
       return Colors.purple;
     }
     if(weatherStateName == 'Sunny' ) {
       return Colors.yellow;
     }
     if(weatherStateName == 'Thunderstorm' || weatherStateName == 'Thunder'){
       return Colors.green;
     }
     else {
       return Colors.blue;
     }

   }
}