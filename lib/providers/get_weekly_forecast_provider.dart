import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/helpers/api_helper.dart';
import '/models/weekly_weather.dart';

final weeklyForecastProvider = FutureProvider<WeeklyWeather>(
  (ref) => ApiHelper.getWeeklyForecast(),
);
