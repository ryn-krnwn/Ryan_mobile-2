import '../../data/models/weather_model.dart';
import '../repositories/weather_repository.dart';

/// Use case class to get current weather.
class GetWeatherUsecase {
  GetWeatherUsecase(this.weatherRepository);

  final WeatherRepository weatherRepository;

  Future<WeatherModel> call(String cityName) {
    return weatherRepository.getCurrentWeatherByCity(cityName);
  }
}
