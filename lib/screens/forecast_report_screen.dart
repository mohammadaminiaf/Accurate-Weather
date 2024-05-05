import 'package:flutter/material.dart';

import '/constants/app_colors.dart';
import '/constants/text_styles.dart';
import '/views/gradient_container.dart';
import '/views/hourly_forecast_view.dart';
import '/views/weekly_forecast_view.dart';

class ForecastReportScreen extends StatelessWidget {
  const ForecastReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const GradientContainer(
      children: [
        // Page Title
        Text(
          'Forecast Report',
          style: TextStyles.h1,
        ),

        SizedBox(height: 40),

        // Today's date
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Today',
              style: TextStyles.h2,
            ),
            Text(
              'April 30, 2024',
              style: TextStyles.subtitleText,
            ),
          ],
        ),

        SizedBox(height: 20),

        // Today's forecast
        HourlyForecastView(),

        SizedBox(height: 20),

        // Next Forecast
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Next Forecast',
              style: TextStyles.h2,
            ),
            Icon(
              Icons.calendar_month_rounded,
              color: AppColors.white,
            ),
          ],
        ),

        SizedBox(height: 30),

        // Weekly forecast
        WeeklyForecastView(),
      ],
    );
  }
}
