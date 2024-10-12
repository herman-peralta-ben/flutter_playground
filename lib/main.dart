import 'package:flutter/material.dart';
import 'package:flutter_playground/examples/state/riverpod_counter_example/riverpod_counter_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Playground',
      themeMode: ThemeMode.system, // Default mode
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blueGrey, brightness: Brightness.dark),
        useMaterial3: true,
      ),
      home: const RiverpodCounterExampleScreen(),
      // const WidgetRepaintBoundaryExampleScreen(),
    );
  }
}
