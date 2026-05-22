// import 'package:flutter/material.dart';
// import 'package:weatherapp/models/weather_model.dart';
// import 'package:weatherapp/views/search_view.dart';
// import 'package:weatherapp/widgets/no_weather_body.dart';
//
// import '../widgets/weather_info_body.dart';
//

/// using set state only not using bloc
// class HomeView extends StatefulWidget {
//   const HomeView({super.key});
//
//   @override
//   State<HomeView> createState() => _HomeViewState();
// }
//
// class _HomeViewState extends State<HomeView> {
//   WeatherModel? weatherModelS;
//
//   void openSearch() async {
//     final WeatherModel weatherModel = await Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => SearchView()),
//     );
//
//     if (weatherModel != null) {
//       setState(() {
//         weatherModelS = weatherModel;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Weather App'),
//         actions: [IconButton(onPressed: openSearch, icon: Icon(Icons.search))],
//       ),
//       body: weatherModelS == null
//           ? NoWeatherBody()
//           : WeatherInfoBody(weatherModel: weatherModelS!),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/home_view_cubit/get_weather_cubit.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/views/search_view.dart';
import 'package:weatherapp/widgets/no_weather_body.dart';

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
      body: BlocBuilder<GetWeatherCubit, GetWeatherState>(
        builder: (context, state) {
          if (state is HomeViewLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is HomeViewInitial) {
            return NoWeatherBody();
          } else if (state is HomeViewSuccess) {
            return WeatherInfoBody(
              // this is for first way to access the weathe model
              // weatherModel: BlocProvider.of<GetWeatherCubit>(
              //   context,
              // ).weatherModel!,

              //.................................................................
              // this is for second way to access the weathe model
              // weatherModel: state.weatherModel,
            );
          } else {
            return Text("oops there was an error ");
          }
        },
      ),
    );
  }
}
