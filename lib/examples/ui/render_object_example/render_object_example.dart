import 'package:flutter/material.dart';
import 'package:flutter_playground/common/ui/common.dart';
import 'package:flutter_playground/examples/ui/render_object_example/animated_circular_progress_indicator.dart';
import 'package:flutter_playground/examples/ui/render_object_example/custom_circular_progress_indicator.dart';

class RenderObjectExampleScreen extends StatelessWidget {
  const RenderObjectExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("RenderObject Example Screen"),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            ExampleCard(
              title: "Custom LeafRenderObjectWidget, static",
              child: SizedBox(
                height: 200,
                width: 200,
                child: CustomCircularProgressIndicatorWidget(
                  value: 0.75,
                  color: Colors.green,
                  strokeWidth: 8.0,
                ),
              ),
            ),
            Divider(),
            ExampleCard(
              title: "Animated widget built from the above widget",
              child: SizedBox(
                height: 200,
                width: 200,
                child: AnimatedCircularProgressIndicator(
                  value: 0.75,
                  color: Colors.green,
                  strokeWidth: 8.0,
                  animationType: AnimationType.repeatInverse,
                ),
              ),
            ),
            Divider(),
            Text(
                "TODO: Make AnimatedCircularProgressIndicator internally work with RepaintBoundary")
          ],
        ),
      ),
    );
  }
}
