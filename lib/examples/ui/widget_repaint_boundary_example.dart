import 'package:flutter/material.dart';
import 'package:flutter_playground/common/ui/assets.dart';
import 'package:flutter_playground/common/ui/common.dart';
import 'package:flutter_playground/common/mixins/debug_repaint_mixin.dart';

/// Note: You can verify whether you need to wrap your widget in a [RepaintBoundary]
/// by inspecting the [renderObject.diagnosis] value using the Flutter Inspector.
/// The [diagnosis] property provides a suggestion indicating whether or not
/// you should keep the [RepaintBoundary].
// https://lazebny.io/repaint-boundary/
class WidgetRepaintBoundaryExampleScreen extends StatefulWidget {
  const WidgetRepaintBoundaryExampleScreen({super.key});

  @override
  State<WidgetRepaintBoundaryExampleScreen> createState() => _WidgetRepaintBoundaryExampleScreenState();
}

class _WidgetRepaintBoundaryExampleScreenState extends State<WidgetRepaintBoundaryExampleScreen>
    with DebugRepaintMixin {
  bool useBoundaryInProgress = true;
  bool useBoundaryInImage = true;
  bool useBoundaryInGif = true;
  int imageIndex = 0;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Widget RepaintBoundary Example"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SwitchItem(
                  text: "Wrap FadeInImage in RepaintBoundary?",
                  value: useBoundaryInImage,
                  onChanged: (value) => setState(() => useBoundaryInImage = value),
                ),
                SizedBox(
                  width: 144,
                  height: 144,
                  child: useBoundaryInImage
                      ? RepaintBoundary(child: SlowFadeImage(RemoteImageAsset.values[imageIndex].url))
                      : SlowFadeImage(RemoteImageAsset.values[imageIndex].url),
                ),
                OutlinedButton(
                  onPressed: () => setState(() {
                    imageIndex = (imageIndex + 1) % RemoteImageAsset.values.length;
                  }),
                  child: const Text("Next Image"),
                ),
                const Divider(),
                SwitchItem(
                  text: "Wrap Gif in RepaintBoundary?",
                  value: useBoundaryInGif,
                  onChanged: (value) => setState(() => useBoundaryInGif = value),
                ),
                SizedBox(
                  width: 240,
                  height: 190,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: useBoundaryInGif
                        ? RepaintBoundary(child: Image.asset(LocalImageAsset.mario64.path))
                        : Image.asset(LocalImageAsset.mario64.path),
                  ),
                ),
                const Divider(),
                SwitchItem(
                  text: "Wrap progress in RepaintBoundary?",
                  value: useBoundaryInProgress,
                  onChanged: (value) => setState(() => useBoundaryInProgress = value),
                ),
                useBoundaryInProgress
                    ? const RepaintBoundary(child: CircularProgressIndicator())
                    : const CircularProgressIndicator(),
                const Divider(),
                Text("TODO ListView repaint example"),
                // TODO ListView repaint example
              ],
            ),
            //Center(child: RepaintBoundary(child: CircularProgressIndicator()))
          ],
        ),
      ),
    );
  }
}
