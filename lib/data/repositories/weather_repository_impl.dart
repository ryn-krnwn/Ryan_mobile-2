import '../../domain/repositories/weather_repository.dart';
import '../datasources/remote/weather_remote_datasource.dart';
import '../models/weather_model.dart';

/// This is an implementation class of [WeatherRepository].
class WeatherRepositoryImpl implements WeatherRepository {
  WeatherRepositoryImpl({required this.weatherRemoteDataSource});

  final WeatherRemoteDataSource weatherRemoteDataSource;

  @override
  Future<WeatherModel> getCurrentWeatherByCity(String cityName) async {
    final result =
        await weatherRemoteDataSource.getCurrentWeatherByCity(cityName);
    return result;
  }
}
