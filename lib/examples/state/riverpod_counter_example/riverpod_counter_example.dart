import 'package:flutter/material.dart';
import 'package:flutter_playground/common/ui/common.dart';
import 'package:flutter_playground/examples/state/riverpod_counter_example/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RiverpodCounterExampleScreen extends StatelessWidget {
  const RiverpodCounterExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod Counter Example'),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            /// Typically [ProviderScope] is used as `runApp(ProviderScope())` so you can reference your providers
            /// on the entire app.
            /// Use it to set a scope where you want to use your Riverpod providers, see bellow how this
            /// can be used as dependency injector.
            ProviderScope(
              child: ExampleCard(
                title: "Positive counter",
                child:

                    /// Use [Consumer] to listen to [counterProvider] and avoid unnecessary repaints.
                    /// "You should scope your provider consumption as locally as possible,
                    /// only in the part of the widget tree where it’s actually needed.
                    /// This helps to avoid unnecessary rebuilds and improves performance by limiting
                    /// the area of the widget tree that reacts to provider changes."
                    /// If [RiverpodCounterExampleScreen] was a [ConsumerWidget], the entire screen could
                    /// repaint on state changes.
                    /// Other option is extracting the below Column into a [ConsumerWidget].
                    Consumer(
                  builder: (context, ref, child) {
                    final counter = ref.watch(counterProvider);

                    return Column(
                      children: [
                        Text('Count: $counter'),
                        ElevatedButton(
                          onPressed: ref.read(counterProvider.notifier).operate,
                          child: const Text('Increment'),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),

            /// Demo, how you can use inject another implementation for the same [_counterProvider] provider.
            /// Pass [overrides] as dependency injector, so you could swap
            /// between provider implementations.
            ProviderScope(
              overrides: [
                counterProvider.overrideWith(() => NegativeCounterNotifier()),
              ],
              child: ExampleCard(
                title: "Overriden provider, negative counter",

                /// Consuming the provider at this point
                child: Consumer(
                  builder: (context, ref, child) {
                    final counter = ref.watch(counterProvider);

                    return Column(
                      children: [
                        Text('Count: $counter'),
                        ElevatedButton(
                          onPressed: ref.read(counterProvider.notifier).operate,
                          child: const Text('Decrement'),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
