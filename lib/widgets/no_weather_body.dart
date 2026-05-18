import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('there is no weather 😔 start', style: TextStyle(fontSize: 30)),
          Text('searching now 🔍', style: TextStyle(fontSize: 30)),
        ],
      ),
    );
  }
}
