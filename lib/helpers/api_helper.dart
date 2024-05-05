import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show debugPrint, immutable;
import 'package:new_test/models/weekly_weather.dart';

import '/models/hourly_weather.dart';
import '/models/weather.dart';
import '/services/getlocator.dart';

@immutable
class ApiHelper {
  // static const currentWeatherUrl = 'https://api.openweathermap.org/data/2.5/weather?';
  // static const hourlyWeatherUrl = 'https://api.openweathermap.org/data/2.5/forecast?';
  static const baseUrl = 'https://api.openweathermap.org/data/2.5';
  static const weeklyWeatherUrl =
      'https://api.open-meteo.com/v1/forecast?current=&daily=weather_code,temperature_2m_max,temperature_2m_min&timezone=auto';

  // static const String apiKey = '19d2fd7aab958bfe7f61000e1f5151cc';
  static const String apiKey = '7ac000ad65981ddaf389a014e439b0b3';
  static final dio = Dio();

  static Future<Weather> getCurrentWeather() async {
    try {
      final location = await getLocation();
      final lat = location.latitude;
      final lon = location.longitude;

      final url =
          '$baseUrl/weather?lat=$lat&lon=$lon&units=metric&appid=$apiKey';

      final response = await dio.get(url);

      if (response.statusCode != 200) {
        throw Exception('Failed to load weather data');
      }

      final weather = Weather.fromJson(response.data);

      return weather;
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<HourlyWeather> getHourlyForecast() async {
    try {
      final location = await getLocation();
      final lat = location.latitude;
      final lon = location.longitude;

      final url =
          '$baseUrl/forecast?lat=$lat&lon=$lon&units=metric&appid=$apiKey';

      final response = await dio.get(url);

      if (response.statusCode != 200) {
        debugPrint('==========> Failed to load data');
        throw Exception('Failed to load weather data');
      }

      final hourlyWeather = HourlyWeather.fromJson(response.data);

      return hourlyWeather;
    } catch (e) {
      debugPrint('Error Code: ${e.toString()}');
      throw Exception(e.toString());
    }
  }

  //! Get Weekly Forecast
  static Future<WeeklyWeather> getWeeklyForecast() async {
    try {
      final location = await getLocation();
      final lat = location.latitude;
      final lon = location.longitude;

      final url = '$weeklyWeatherUrl&latitude=$lat&longitude=$lon';

      final response = await dio.get(url);

      if (response.statusCode != 200) {
        throw Exception('Failed to load weather data');
      }

      final weeklyWeather = WeeklyWeather.fromJson(response.data);

      return weeklyWeather;
    } catch (e) {
      throw Exception(e);
    }
  }
}
