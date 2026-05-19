import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/services/weather_service.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(title: Text("search city")),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Center(
            child: TextField(
              onSubmitted: (value) async {
                WeatherModel weatherModel = await WeatherService(
                  Dio(),
                ).getCurrentWeather(cityName: value);

                log(weatherModel.cityName);

                Navigator.pop(context,weatherModel);
              },
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.search),
                hintText: "Enter city name",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                label: Text("search"),
                // enabledBorder: OutlineInputBorder(),
                // focusedBorder: OutlineInputBorder(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
