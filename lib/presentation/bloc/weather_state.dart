part of 'weather_bloc.dart';

/// Abstract class to accommodate weather state conditions.
abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

/// The state where [WeatherState] is initializing the state.
class WeatherInitialState extends WeatherState {}

/// The state where [WeatherState] is loading data.
class WeatherLoadingState extends WeatherState {}

/// The state where [WeatherState] has loaded [WeatherModel].
class WeatherLoadedState extends WeatherState {
  const WeatherLoadedState(this.weatherModel);

  final WeatherModel weatherModel;

  @override
  List<Object> get props => [weatherModel];
}

/// The state where [WeatherState] has an error including and error message.
class WeatherErrorState extends WeatherState {
  const WeatherErrorState(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
