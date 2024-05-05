import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/helpers/api_helper.dart';
import '/models/hourly_weather.dart';

final hourlyWeatherProvider = FutureProvider<HourlyWeather>(
  (ref) => ApiHelper.getHourlyForecast(),
);
