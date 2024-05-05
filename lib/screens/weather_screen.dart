import 'package:flutter/material.dart';

import '/constants/app_colors.dart';
import '/constants/text_styles.dart';
import '/extensions/datetime.dart';
import '/extensions/double.dart';
import '/extensions/strings.dart';
import '/helpers/api_helper.dart';
import '/models/weather.dart';
import '/views/gradient_container.dart';
import '/views/hourly_forecast_view.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  bool isLoading = false;
  Weather? _currentWeather;

  @override
  void initState() {
    _fetchCurrentWeather();
    super.initState();
  }

  Future<void> _fetchCurrentWeather() async {
    setState(() => isLoading = true);
    _currentWeather = await ApiHelper.getCurrentWeather();
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_currentWeather != null) {
      final weather = _currentWeather!;

      return GradientContainer(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 20,
                width: double.infinity,
              ),
              // Country name text
              Text(
                weather.name,
                style: TextStyles.h1,
              ),

              const SizedBox(height: 20),

              // Today's date
              Text(
                DateTime.now().dateTime,
                style: TextStyles.subtitleText,
              ),

              const SizedBox(height: 30),

              // Weather icon big
              SizedBox(
                height: 260,
                child: Image.asset(
                  'assets/icons/${weather.weather[0].icon.replaceAll('n', 'd')}.png',
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 30),

              Text(
                weather.weather[0].description.capitalize,
                style: TextStyles.h2,
              ),

              const SizedBox(height: 40),

              // Weather info in a row
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    WeatherInfoTile(
                      title: 'Temp',
                      value: '${weather.main.temp}°',
                    ),
                    WeatherInfoTile(
                      title: 'Wind',
                      value: '${weather.wind.speed.kmh} km/h',
                    ),
                    WeatherInfoTile(
                      title: 'Humidity',
                      value: '${weather.main.humidity}%',
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 40),

          // Today Daily Forecast
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Today',
                style: TextStyle(
                  fontSize: 20,
                  color: AppColors.white,
                ),
              ),
              InkWell(
                onTap: () {},
                child: const Text(
                  'View full report',
                  style: TextStyle(
                    color: AppColors.lightBlue,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 15),

          // hourly forcast
          const HourlyForecastView(),

          const SizedBox(height: 30),
        ],
      );
    }

    return const Center(
      child: Text(
        'An error has occurred',
      ),
    );
  }
}

class WeatherInfoTile extends StatelessWidget {
  const WeatherInfoTile({
    super.key,
    required this.title,
    required this.value,
  }) : super();

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Title
        Text(
          title,
          style: TextStyles.subtitleText,
        ),
        const SizedBox(height: 10),
        Text(
          value,
          style: TextStyles.h3,
        )
      ],
    );
  }
}
