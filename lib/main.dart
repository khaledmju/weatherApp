import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/home_view_cubit/get_weather_cubit.dart';
import 'package:weatherapp/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),

      // we will use builder bc we need to pass the weatherCondition to getWeatherCondition
      // and bc the context without the builder will not have a GetWeatherCubit
      // so we will use Builder to let the context have a WeatherCubit
      // ........................ to understand what i wrote above go to Weather Course of Tharwat Samy
      // video number 49
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, GetWeatherState>(
          builder: (context, state) {
            return MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: getWeatherCondition(
                  BlocProvider.of<GetWeatherCubit>(
                    context,
                  ).weatherModel?.weatherCondition,
                ),
                useMaterial3: false,
              ),
              home: HomeView(),
            );
          },
        ),
      ),
    );
  }

  MaterialColor getWeatherCondition(String? condition) {
    if (condition == null) {
      return Colors.grey;
    }

    switch (condition) {
      // 1. Sunny / Clear
      case 'Sunny' || 'Clear':
        return Colors.amber;

      // 2. Cloudy / Overcast / Mist / Fog
      case 'Partly cloudy' ||
          'Partlycloudy' ||
          'Cloudy' ||
          'Overcast' ||
          'Mist' ||
          'Fog' ||
          'Freezing fog' ||
          'Freezingfog':
        return Colors.blueGrey;

      // 3. Thunderstorms (All thunder grouped together)
      case 'Thundery outbreaks possible' ||
          'Thunderyoutbreakspossible' ||
          'Patchy light rain with thunder' ||
          'Patchylightrainwiththunder' ||
          'Moderate or heavy rain with thunder' ||
          'Moderateorheavyrainwiththunder' ||
          'Patchy light snow with thunder' ||
          'Patchylightsnowwiththunder' ||
          'Moderate or heavy snow with thunder' ||
          'Moderateorheavysnowwiththunder':
        return Colors.deepPurple;

      // 4. Snow / Sleet / Ice / Blizzard
      case 'Patchy snow possible' ||
          'Patchysnowpossible' ||
          'Patchy sleet possible' ||
          'Patchysleetpossible' ||
          'Blowing snow' ||
          'Blowingsnow' ||
          'Blizzard' ||
          'Light sleet' ||
          'Lightsleet' ||
          'Moderate or heavy sleet' ||
          'Moderateorheavysleet' ||
          'Patchy light snow' ||
          'Patchylightsnow' ||
          'Light snow' ||
          'Lightsnow' ||
          'Patchy moderate snow' ||
          'Patchymoderatesnow' ||
          'Moderate snow' ||
          'Moderatesnow' ||
          'Patchy heavy snow' ||
          'Patchyheavysnow' ||
          'Heavy snow' ||
          'Heavysnow' ||
          'Ice pellets' ||
          'Icepellets' ||
          'Light sleet showers' ||
          'Lightsleetshowers' ||
          'Moderate or heavy sleet showers' ||
          'Moderateorheavysleetshowers' ||
          'Light snow showers' ||
          'Lightsnowshowers' ||
          'Moderate or heavy snow showers' ||
          'Moderateorheavysnowshowers' ||
          'Light showers of ice pellets' ||
          'Lightshowersoficepellets' ||
          'Moderate or heavy showers of ice pellets' ||
          'Moderateorheavyshowersoficepellets':
        return Colors.lightBlue;

      // 5. Rain / Drizzle / Freezing Drizzle
      case 'Patchy rain possible' ||
          'Patchyrainpossible' ||
          'Patchy freezing drizzle possible' ||
          'Patchyfreezingdrizzlepossible' ||
          'Patchy light drizzle' ||
          'Patchylightdrizzle' ||
          'Light drizzle' ||
          'Lightdrizzle' ||
          'Freezing drizzle' ||
          'Freezingdrizzle' ||
          'Heavy freezing drizzle' ||
          'Heavyfreezingdrizzle' ||
          'Patchy light rain' ||
          'Patchylightrain' ||
          'Light rain' ||
          'Lightrain' ||
          'Moderate rain at times' ||
          'Moderaterainattimes' ||
          'Moderate rain' ||
          'Moderaterain' ||
          'Heavy rain at times' ||
          'Heavyrainattimes' ||
          'Heavy rain' ||
          'Heavyrain' ||
          'Light freezing rain' ||
          'Lightfreezingrain' ||
          'Moderate or heavy freezing rain' ||
          'Moderateorheavyfreezingrain' ||
          'Light rain shower' ||
          'Lightrainshower' ||
          'Moderate or heavy rain shower' ||
          'Moderateorheavyrainshower' ||
          'Torrential rain shower' ||
          'Torrentialrainshower':
        return Colors.blue;

      // Fallback if an unexpected string passes through
      default:
        return Colors.grey;
    }
  }
}
