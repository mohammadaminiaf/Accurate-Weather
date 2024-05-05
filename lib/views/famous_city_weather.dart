import 'package:flutter/material.dart';

import '/widgets/city_weather_tile.dart';

class FamousCityWeather extends StatelessWidget {
  const FamousCityWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemBuilder: (context, index) {
        return CityWeatherTile(
          index: index,
          cityName: 'California',
          weatherIcon: '01d',
          weatherDescription: 'Cloudy',
          temperature: 32,
        );
      },
    );
  }
}
