import 'package:flutter/material.dart';
import 'package:whatstats/main_screen.dart';
import 'app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: darkElegantScheme,
        splashFactory: NoSplash.splashFactory,
        scaffoldBackgroundColor: darkElegantScheme.surface,
        textTheme: ThemeData.dark().textTheme.apply(
          bodyColor: darkElegantScheme.onSurface,
          displayColor: darkElegantScheme.onSurface,
        ),
        useMaterial3: true,
      ),

      initialRoute: '/',
      routes: {
        '/': (context) => MainScreen(),
      },
    );
  }
}

