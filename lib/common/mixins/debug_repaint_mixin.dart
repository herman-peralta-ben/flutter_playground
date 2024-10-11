import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// Mixin to enable and disable the repaint rainbow for debugging
mixin DebugRepaintMixin<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    super.initState();

    /// Use [debugRepaintRainbowEnabled] to paint colored rectangles wrapping the Screen and Widgets requesting draw updates.
    debugRepaintRainbowEnabled = true;
  }

  @override
  void dispose() {
    debugRepaintRainbowEnabled = false;
    super.dispose();
  }
}
