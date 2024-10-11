import 'package:flutter_riverpod/flutter_riverpod.dart';

/// This is a [ChangeNotifierProvider] widget for Provider package.
/// We can reference a concrete [MyIntNotifier] instance using the [counterProvider] in a child widget of [ProviderScope].
/// Note that for testing purposes, we pass the type as [MyIntNotifier],
/// so we can alternate with [_NegativeCounterNotifier].
final counterProvider =
    NotifierProvider< /*_CounterNotifier*/ MyIntNotifier, int>(
        CounterNotifier.new);

abstract class MyIntNotifier extends Notifier<int> {
  @override
  int build() => 0;

  void operate();
}

/// Analog to Provider's ChangeNotifier.
class CounterNotifier extends MyIntNotifier {
  @override
  void operate() => state++;
}

/// Alternate provider, to show how to override providers on [ProviderScope].
class NegativeCounterNotifier extends MyIntNotifier {
  @override
  void operate() => state--;
}
