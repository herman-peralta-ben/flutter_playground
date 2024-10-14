import 'package:flutter/material.dart';
import 'package:flutter_playground/navigation/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // [!Add deeplinks]
    return MaterialApp.router(
      title: 'Flutter Playground',
      routerConfig: router,
      themeMode: ThemeMode.system, // Default mode
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey, brightness: Brightness.dark),
        useMaterial3: true,
      ),
    );
  }
}
