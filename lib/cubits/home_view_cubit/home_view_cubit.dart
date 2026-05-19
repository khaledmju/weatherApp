import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../models/weather_model.dart';
import '../../services/weather_service.dart';

part 'home_view_state.dart';

class HomeViewCubit extends Cubit<HomeViewState> {
  HomeViewCubit() : super(HomeViewInitial());

  getWeather({required String cityName}) async {
    try {
      WeatherModel weatherModel = await WeatherService(
        Dio(),
      ).getCurrentWeather(cityName: cityName);

      emit(HomeViewSuccess());
    } catch (e) {
      emit(HomeViewFailure());
    }
  }
}
