import 'package:flutter/material.dart';
import 'package:weatherapp/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key, required this.weatherModel});

  // if i use the first way of create the weather model in cubit
  // i can delete the line of .......... final weather weather model..............
  // and use  in widget build
  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    // here i can add var weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel
    // and use weatherModel in widgets
    // ofc if use the first way of create weather model in GetWeatherCubit
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            // 'Alexandria',
            weatherModel.cityName,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
          ),
          Text(
            // 'updated at 23:46',
            "updated at ${weatherModel.date.hour}:${weatherModel.date.minute}",
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Image.asset('assets/images/cloudy.png'),
              Image.network("https:${weatherModel.image!}"),
              Text(
                // '17',
                weatherModel.temp.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),
              Column(
                children: [
                  Text(
                    // 'Maxtemp: 24',
                    "Maxtemp ${weatherModel.maxTemp.toString()}",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    // 'Mintemp: 16',
                    "MinTemp ${weatherModel.minTemp.toString()}",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 32),
          Text(
            // 'Ligh Rain',
            weatherModel.weatherCondition,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
          ),
        ],
      ),
    );
  }
}
