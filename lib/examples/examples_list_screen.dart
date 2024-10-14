import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Example {
  final String route;
  final String title;
  const Example(this.route, this.title);
}

class ExamplesListScreen extends StatelessWidget {
  final String title;
  final List<Example> examples;
  const ExamplesListScreen({
    super.key,
    required this.title,
    required this.examples,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: examples.length,
        itemBuilder: (_, i) => OutlinedButton(
          onPressed: () => context.go(examples[i].route),
          child: Text(examples[i].title),
        ),
      ),
    );
  }
}
