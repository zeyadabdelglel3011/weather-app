import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/Weather_Service.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState>
{
      WeatherCubit(this.weatherService) : super(WeatherInitial());

      WeatherService weatherService = WeatherService();

      String? cityName ;

      WeatherModel? weatherModel ;

   void getWeather({required String cityName})
    async  {
      emit(WeatherLoading());
       try{
       weatherModel =   await weatherService.getWeather(cityName: cityName);
         emit(WeatherSuccess());
       }on Exception catch(e){
         emit(WeatherFailed());
         print(e);
       }
       return null ;
      }

}
