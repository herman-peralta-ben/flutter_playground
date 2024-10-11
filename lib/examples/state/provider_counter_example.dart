import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class _CounterViewModel with ChangeNotifier {
  var count = 0;
  void increment() {
    count++;

    /// Emit update to observers
    notifyListeners();
  }
}

class ProviderCounterExampleScreen extends StatelessWidget {
  const ProviderCounterExampleScreen({super.key});
  @override
  Widget build(BuildContext context) {
    /// The ChangeNotifierProvider widget provides an instance of _CounterViewModel
    /// to the widget tree. It listens for changes to the _CounterViewModel
    /// (which extends ChangeNotifier) and rebuilds any widgets (underlying widget tree) that
    /// depend on it when notifyListeners() is called.
    return ChangeNotifierProvider(
      create: (context) => _CounterViewModel(),
      child: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<_CounterViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Counter Example'),
      ),
      body: Center(
        child: Text('Counter: ${counter.count}'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counter.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
