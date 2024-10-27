import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/cubits/weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';

import '../services/Weather_Service.dart';

class SearchPage  extends StatelessWidget {

late String cityName  ;
SearchPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.blue,
        title: Text(

          'Search a City',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
      ),
      body:Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: TextField(
             onChanged: (data){
               cityName = data;
            },
            onSubmitted: (data) async{
              cityName = data;
             BlocProvider.of<WeatherCubit>(context)
                 .getWeather(cityName: cityName);
              BlocProvider.of<WeatherCubit>(context)
                  .cityName = cityName;
             Navigator.pop(context);

            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                  vertical: 25.0,
                  horizontal: 20.0),
              hintText: 'Enter a City',
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              suffixIcon: GestureDetector(
                onTap: ()
                async{
                    WeatherService service = WeatherService();

                     WeatherModel weather = await service.getWeather(cityName: cityName!,);

                     Provider.of<WeatherProvider>(context, listen: false).weatherData = weather;
                     Provider.of<WeatherProvider>(context,listen: false).cityName = cityName;
                      Navigator.pop(context);

    },
                child: Icon(
                  Icons.search,
                ),
              ),
              label: const Text(
                'search',
              ),
            ),
          ),
        ),
      ),
    );
  }
}


