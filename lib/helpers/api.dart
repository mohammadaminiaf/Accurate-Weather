import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherApi {
  Future getTodayWeather({
    required String city,
    required String countryCode,
  }) async {
    try {
      Uri url = Uri.parse(
          'http://api.openweathermap.org/data/2.5/weather?q=$city,$countryCode&APPID=5e2165a12c75b9be52c7d5b4fcc3af53');

      final http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);
        return decodedData;
      }
    } catch (e) {
      return null;
    }
  }

  Future get5DaysWeather({
    required String city,
    required String countryCode,
  }) async {
    try {
      Uri url = Uri.parse(
          'http://api.openweathermap.org/data/2.5/forecast?q=$city,$countryCode&appid=5e2165a12c75b9be52c7d5b4fcc3af53');

      final http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);
        return decodedData;
      }
    } catch (e) {
      return null;
    }
  }

  

  String getWeatherIcon({
    required int weatherCode,
  }) {
    String weatherCondition = '01d';

    if (weatherCode == 801) {
      weatherCondition = '02d';
    } else if (weatherCode == 802) {
      weatherCondition = '03d';
    } else if (weatherCode == 803) {
      weatherCondition = '04d';
    } else if (weatherCode == 804) {
      weatherCondition = '04d';
    } else if (weatherCode == 800) {
      weatherCondition = '01d';
    } else if (weatherCode > 700) {
      weatherCondition = '50d';
    } else if (weatherCode >= 600) {
      weatherCondition = '13d';
    } else if (weatherCode >= 500) {
      weatherCondition = '10d';
    } else if (weatherCode >= 300) {
      weatherCondition = '09d';
    } else if (weatherCode >= 200) {
      weatherCondition = '11d';
    }

    return weatherCondition;
  }



}
