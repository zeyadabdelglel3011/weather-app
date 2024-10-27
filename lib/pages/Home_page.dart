import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/cubits/weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/providers/weather_provider.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});

  WeatherModel? weatherData;



  @override
  Widget build(BuildContext context) {



    return  Scaffold(
    appBar: AppBar(
      elevation: 20,
      actions: [
        IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                      return SearchPage(

                      );
              }));
            },
            icon: Icon(
             Icons.search,
              color: Colors.white,
              size: 25.0,
            ),
        ),
      ],
    title: Text('Weather App',
    style: TextStyle(
      color: Colors.white,
    ),
    ),
            ),
      body: BlocBuilder<WeatherCubit , WeatherState>(
          builder: (context , state)
          {
            if(state is WeatherLoading){
              return Center(
                child: CircularProgressIndicator(),
              );
            }else if(state is WeatherSuccess){
         weatherData =     BlocProvider.of<WeatherCubit>(context).weatherModel;

            return   Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        weatherData!.getThemeColor(),
                        weatherData!.getThemeColor()[300]!,
                        weatherData!.getThemeColor()[100]!,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(flex: 3,),
                    Text(
                      BlocProvider.of<WeatherCubit>(context).cityName!,
                      style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'updated at: ${weatherData!.date!.toString()}',
                      style: TextStyle(
                        fontSize: 20.0,

                      ),
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                      children: [
                        Image.asset(weatherData!.getImage()),
                        Text(
                          '${weatherData!.temp!.toInt()}',
                          style: TextStyle(
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              'Max Temp : ${weatherData!.maxTemp!.toInt()}',
                            ),
                            Text(
                                'Min Temp : ${weatherData!.minTemp!.toInt()}'),

                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Text(
                      weatherData!.weatherStateName?? '',
                      style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(flex: 5,),

                  ],

                ),
              ) ;

            }
            else if(state is WeatherFailed){
              return Center(
                child: Text(
                    'There is an error !! please enter a city name',
                ),
              );
            }
            else{
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'There is no weather ,, ',
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'start searching now !',
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              );
            }
          }
      ),
      );
  }
}
