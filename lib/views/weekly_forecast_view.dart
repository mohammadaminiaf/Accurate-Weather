import 'package:flutter/material.dart';

import '/constants/app_colors.dart';
import '/constants/text_styles.dart';
import '/core/widgets/subscript_text.dart';

class WeeklyForecastView extends StatefulWidget {
  const WeeklyForecastView({super.key});

  @override
  State<WeeklyForecastView> createState() => _WeeklyForecastViewState();
}

class _WeeklyForecastViewState extends State<WeeklyForecastView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 7,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return const WeeklyForecastTile(
            date: 'April, 30',
            day: 'Friday',
            icon: '01d',
            temp: 30,
          );
        },
      ),
    );
  }
}

class WeeklyForecastTile extends StatelessWidget {
  const WeeklyForecastTile({
    super.key,
    required this.day,
    required this.date,
    required this.temp,
    required this.icon,
  });

  final String day;
  final String date;
  final int temp;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 20,
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.accentBlue,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                day,
                style: TextStyles.h3,
              ),
              const SizedBox(height: 5),
              Text(
                date,
                style: TextStyles.subtitleText,
              ),
            ],
          ),

          // Temperature
          SuperscriptText(
            text: '$temp',
            color: AppColors.white,
            superScript: '°C',
            superscriptColor: AppColors.white,
          ),

          // weather icon
          Image.asset(
            'assets/icons/$icon.png',
            width: 60,
          ),
        ],
      ),
    );
  }
}
