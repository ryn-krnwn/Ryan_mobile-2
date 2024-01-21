import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/weather_model.dart';

/// This is an abstract class that manages weather data from remote sources.
abstract class WeatherRemoteDataSource {
  Future<WeatherModel> getCurrentWeatherByCity(String cityName);
}

/// This is a implementation class of [WeatherRemoteDataSource].
class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  WeatherRemoteDataSourceImpl({required this.client});

  /// API key from openweathermap
  final String apiKey = 'cc95d932d5a45d33a9527d5019475f2c';

  /// Base url API from openweathermap
  final String baseUrl = 'https://api.openweathermap.org/data/2.5';

  /// Initialize http client API
  final http.Client client;

  /// Get weather data for today by city name.
  ///
  /// Returns the new [WeatherModel].
  /// Throw an [Exception] if server response code not 200.
  @override
  Future<WeatherModel> getCurrentWeatherByCity(String cityName) async {
    final response =
        await client.get(Uri.parse(getUriForCurrentWeatherByCity(cityName)));

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(json.decode(response.body));
    } else {
      throw Exception();
    }
  }

  /// Returns complete uri string.
  String getUriForCurrentWeatherByCity(String city) =>
      '$baseUrl/weather?q=$city&appid=$apiKey';
}
