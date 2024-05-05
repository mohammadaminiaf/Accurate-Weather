import 'package:flutter/material.dart';

import '/constants/app_colors.dart';
import '/constants/text_styles.dart';

class CityWeatherTile extends StatelessWidget {
  const CityWeatherTile({
    super.key,
    required this.cityName,
    required this.weatherIcon,
    required this.weatherDescription,
    required this.temperature,
    required this.index,
  });

  final String cityName;
  final String weatherIcon;
  final String weatherDescription;
  final int temperature;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: index % 2 == 1 ? 15 : 0,
        bottom: index % 2 == 0 ? 15 : 0,
      ),
      height: 300,
      child: Material(
        color: index == 0 ? AppColors.lightBlue : AppColors.accentBlue,
        elevation: index == 0 ? 12 : 0,
        borderRadius: BorderRadius.circular(25.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Row 1
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$temperature°',
                        style: TextStyles.h2,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        weatherDescription,
                        style: TextStyles.subtitleText,
                      ),
                    ],
                  ),
                  // Row 2
                  Image.asset(
                    'assets/icons/$weatherIcon.png',
                    width: 50,
                  ),
                ],
              ),
              Text(
                cityName,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white.withOpacity(.8),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
