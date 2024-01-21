part of 'weather_bloc.dart';

/// Abstract class to accommodate weather event conditions.
abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

/// Event when [WeatherEvent] detects a change in city name.
class OnCityChanged extends WeatherEvent {
  const OnCityChanged(this.cityName);

  final String cityName;

  @override
  List<Object> get props => [cityName];
}
