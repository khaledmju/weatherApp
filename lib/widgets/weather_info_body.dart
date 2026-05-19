import 'package:flutter/material.dart';
import 'package:weatherapp/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key, required this.weatherModel});

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
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
            weatherModel.date,
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Image.asset('assets/images/cloudy.png'),
              // Image.network(weatherModel.image!, width: 20, height: 20),
              Text(
                // '17',
                weatherModel.temp.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),
              Column(
                children: [
                  Text(
                    // 'Maxtemp: 24',
                    weatherModel.maxTemp.toString(),
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    // 'Mintemp: 16',
                    weatherModel.minTemp.toString(),
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
