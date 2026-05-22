part of 'get_weather_cubit.dart';

@immutable
sealed class GetWeatherState {}

// the HomeViewInitial is the no weather state so will show the no weather body
final class HomeViewInitial extends GetWeatherState {}

final class HomeViewLoading extends GetWeatherState {}

final class HomeViewSuccess extends GetWeatherState {

  // this is the second way to access the weather model
  final WeatherModel weatherModel ;

  HomeViewSuccess(this.weatherModel);

}

final class HomeViewFailure extends GetWeatherState {}
