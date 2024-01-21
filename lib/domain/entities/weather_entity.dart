import 'package:equatable/equatable.dart';

/// Entity from weather data.
class WeatherEntity extends Equatable {
  const WeatherEntity({
    required this.cityName,
    required this.main,
    required this.description,
    required this.iconCode,
    required this.temperature,
    required this.pressure,
    required this.humidity,
  });

  /// Name of the city.
  final String cityName;

  /// Weather description.
  final String description;

  /// Humidity value.
  final int humidity;

  /// Weather icon code.
  final String iconCode;

  /// Main information containing values of [temperature], [pressure] and [humidity].
  final String main;

  /// Pressure value.
  final int pressure;

  /// Temperature value.
  final double temperature;

  @override
  List<Object?> get props => [
        cityName,
        main,
        description,
        iconCode,
        temperature,
        pressure,
        humidity,
      ];
}
