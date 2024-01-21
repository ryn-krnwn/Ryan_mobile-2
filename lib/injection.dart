import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'data/datasources/remote/weather_remote_datasource.dart';
import 'data/repositories/weather_repository_impl.dart';
import 'domain/repositories/weather_repository.dart';
import 'domain/usecases/get_weather_usecase.dart';
import 'presentation/bloc/weather_bloc.dart';

/// Initialize sl as a service locator.
final sl = GetIt.instance;

/// Initialize all setup service locator.
Future<void> init() async {
  // bloc
  // registering service locator for [WeatherBloc].
  sl.registerFactory(() => WeatherBloc(sl()));

  // usecases
  // registering service locator for [GetWeatherUsecase].
  sl.registerLazySingleton(() => GetWeatherUsecase(sl()));

  // repositories
  // registering service locator for [WeatherRepository].
  sl.registerLazySingleton<WeatherRepository>(
      () => WeatherRepositoryImpl(weatherRemoteDataSource: sl()));

  // datasources
  // registering service locator for [WeatherRemoteDataSource].
  sl.registerLazySingleton<WeatherRemoteDataSource>(
      () => WeatherRemoteDataSourceImpl(client: sl()));

  // external
  // registering service locator for [http.Client].
  sl.registerLazySingleton(() => http.Client());
}
