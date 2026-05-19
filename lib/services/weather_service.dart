import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weatherapp/models/weather_model.dart';

class WeatherService {
  final Dio dio;

  final String baseUrl = "https://api.weatherapi.com/v1";

  final String apiKey = "49c66ef18c4e49a897d83115261805";

  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio.get(
        "$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1",
      );
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);

      return weatherModel;
    } on DioException catch (e) {
      // the ? bc maybe will not have an error massage so we put  ?? and a massage from me
      final String errMessage =
          e.response?.data['error']['massage'] ??
          "oops there was an error , try later";

      throw Exception(errMessage);

      // return null;
    } catch (e) {
      log(e.toString());
      throw Exception("oops there was an error , try later");
    }
  }
}
