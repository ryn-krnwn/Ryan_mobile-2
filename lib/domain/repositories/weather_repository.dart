import '../../data/models/weather_model.dart';

/// Abstract class for weather repository.
abstract class WeatherRepository {
  Future<WeatherModel> getCurrentWeatherByCity(String cityName);
}
