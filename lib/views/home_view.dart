import 'package:flutter/material.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/views/search_view.dart';
import 'package:weatherapp/widgets/no_weather_body.dart';

import '../widgets/weather_info_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  WeatherModel? weatherModelS;

  void openSearch() async {
    final WeatherModel weatherModel = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SearchView()),
    );

    if (weatherModel != null) {
      setState(() {
        weatherModelS = weatherModel;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [IconButton(onPressed: openSearch, icon: Icon(Icons.search))],
      ),
      body: weatherModelS == null
          ? NoWeatherBody()
          : WeatherInfoBody(weatherModel: weatherModelS!),
    );
  }
}
