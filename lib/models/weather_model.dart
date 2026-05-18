class WeatherModel {
  final String cityName;

  final String date;

  // using String? bc im not sure that image will be null or not
  final String? image;

  final String temp;

  final String maxTemp;

  final String minTemp;

  final String weatherCondition;

  WeatherModel({
    required this.cityName,
    required this.date,
    this.image,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherCondition,
  });
}
