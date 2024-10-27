import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/cubits/weather_cubit.dart';
import 'package:weather_app/homee.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/Weather_Service.dart';

import 'design.dart';
import 'pages/Home_page.dart';

void main() {
  runApp( BlocProvider(
      create: (BuildContext context) {
        return WeatherCubit(WeatherService());
      },
  child: MyApp()));
}

class MyApp extends StatelessWidget {

WeatherModel? weather;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        appBarTheme: AppBarTheme(

          backgroundColor:   BlocProvider.of<WeatherCubit>(context).weatherModel == null ? Colors.blue : BlocProvider.of<WeatherCubit>(context).weatherModel!.getThemeColor(),
        ),
      ),
      home: HomePage(),

    );
  }
}
