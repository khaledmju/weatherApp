import 'package:flutter/material.dart';
import 'package:weatherapp/views/search_view.dart';

import '../widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchView()),
              );
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: WeatherInfoBody(),
    );
  }
}
