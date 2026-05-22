import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../models/weather_model.dart';
import '../../services/weather_service.dart';

part 'get_weather_state.dart';

class GetWeatherCubit extends Cubit<GetWeatherState> {
  GetWeatherCubit() : super(HomeViewInitial());

  // to access the weather model we have to way
  // first way we can create weather model here in cubit
  // WeatherModel? weatherModel;

  // second way we can in state of HomeViewSuccess create weather model
  // we can use both way

  getWeather({required String cityName}) async {
    emit(HomeViewLoading());
    try {
      WeatherModel weatherModel = await WeatherService(
        Dio(),
      ).getCurrentWeather(cityName: cityName);

      emit(HomeViewSuccess(weatherModel));
    } catch (e) {
      emit(HomeViewFailure());
    }
  }
}
