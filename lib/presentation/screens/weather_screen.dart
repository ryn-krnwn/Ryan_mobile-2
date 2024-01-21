import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/weather_bloc.dart';

/// This class is the user interface of the weather screen.
class WeatherScreen extends StatelessWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  // Get uri path of weather icon by code.
  String _getWeatherIcon(String iconCode) =>
      'http://openweathermap.org/img/wn/$iconCode@2x.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Prakiraan Cuaca',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(
          top: 80,
          left: 16,
          right: 16,
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/assets/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(
            bottom: 500,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 1.0,
              ),
              const Text(
                "INFO CUACA",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 30),
              ),
              const SizedBox(
                height: 50,
              ),
              TextField(
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: 'Masukan Nama Kota',
                  hintStyle: TextStyle(color: Colors.white),
                ),
                style: const TextStyle(color: Colors.white, fontSize: 20),
                onChanged: (query) {
                  context.read<WeatherBloc>().add(OnCityChanged(query));
                },
              ),
              const SizedBox(height: 50.0),
              BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {
                  if (state is WeatherLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is WeatherLoadedState) {
                    return Column(
                      key: const Key('Data_Cuaca'),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              state.weatherModel.cityName,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 22.0,
                              ),
                            ),
                            Image(
                              image: NetworkImage(
                                _getWeatherIcon(
                                  state.weatherModel.iconCode,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          '${state.weatherModel.main} | ${state.weatherModel.description}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(height: 50.0),
                        Table(
                          defaultColumnWidth: const FixedColumnWidth(150.0),
                          border: TableBorder.all(
                            color: Colors.white,
                            style: BorderStyle.solid,
                            width: 1,
                          ),
                          children: [
                            TableRow(children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Temperature',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  state.weatherModel.temperature.toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    letterSpacing: 1.2,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ), // Will be change later
                            ]),
                            TableRow(children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Pressure',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  state.weatherModel.pressure.toString(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      letterSpacing: 1.2,
                                      fontWeight: FontWeight.bold),
                                ),
                              ), // Will be change later
                            ]),
                            TableRow(children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Humidity',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  state.weatherModel.humidity.toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    letterSpacing: 1.2,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ), // Will be change later
                            ]),
                          ],
                        ),
                      ],
                    );
                  } else if (state is WeatherErrorState) {
                    return const Center(
                      child: Text(
                        'Something went wrong!',
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
