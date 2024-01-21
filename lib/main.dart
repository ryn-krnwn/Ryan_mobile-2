import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'injection.dart' as di; // dependency injector
import 'presentation/bloc/weather_bloc.dart';
import 'presentation/screens/weather_screen.dart';

/// The main method in this project.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Inject all dependecies injector and wait for it is done
  await di.init();
  runApp(const MyApp());
}

/// The main widget class in this project.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<WeatherBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Info Cuaca',
        theme: ThemeData(primarySwatch: Colors.orange),
        home: const WeatherScreen(),
      ),
    );
  }
}
