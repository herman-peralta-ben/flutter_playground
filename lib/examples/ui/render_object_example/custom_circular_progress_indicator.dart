import 'package:flutter/material.dart';

/// Define a custom circular progress indicator. Extending [LeafRenderObjectWidget]
/// since this widget doesn't need a child widget.
class CustomCircularProgressIndicatorWidget extends LeafRenderObjectWidget {
  final double value; // Progress value between 0.0 and 1.0
  final Color color; // Color of the progress indicator
  final double strokeWidth; // Stroke width of the progress indicator

  const CustomCircularProgressIndicatorWidget({
    super.key,
    required this.value,
    this.color = Colors.blue,
    this.strokeWidth = 4.0,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return CustomCircularProgressIndicatorRender(
      value,
      color,
      strokeWidth,
    );
  }

  @override
  void updateRenderObject(BuildContext context, CustomCircularProgressIndicatorRender renderObject) {
    renderObject
      ..value = value
      ..color = color
      ..strokeWidth = strokeWidth;
  }
}

/// RenderObject that handles the painting and layout
class CustomCircularProgressIndicatorRender extends RenderBox {
  double _value;
  Color _color;
  double _strokeWidth;

  CustomCircularProgressIndicatorRender(this._value, this._color, this._strokeWidth);

  // Update properties when the widget is rebuilt
  set value(double newValue) {
    if (newValue != _value) {
      _value = newValue;
      markNeedsPaint(); // Request a repaint
    }
  }

  set color(Color newColor) {
    if (newColor != _color) {
      _color = newColor;
      markNeedsPaint(); // Request a repaint
    }
  }

  set strokeWidth(double newWidth) {
    if (newWidth != _strokeWidth) {
      _strokeWidth = newWidth;
      markNeedsPaint(); // Request a repaint
    }
  }

  @override
  Size get size => const Size(100, 100);

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;
    final paint = Paint()
      ..color = _color
      ..style = PaintingStyle.stroke
      ..strokeWidth = _strokeWidth;

    // Calculate the radius and center
    final radius = size.width / 2;
    final center = offset + Offset(radius, radius);

    // Draw the arc based on the value
    const startAngle = -90 * (3.14 / 180);
    final sweepAngle = 360 * _value * (3.14 / 180);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), startAngle, sweepAngle, false, paint);
  }

  // Set the minimum size to 100x100, but respect the constraints provided by the parent
  @override
  Size computeDryLayout(BoxConstraints constraints) {
    // TODO need to check how to properly manage the size (get the parent widget size), this breaks RepaintBoundary
    //final desiredSize = constraints.constrain(const Size(100, 100));
    //return desiredSize;
    return constraints.constrain(Size.infinite); // This allows the RenderBox to expand to fill the available space
  }

  // Perform the layout based on the constraints provided by the parent
  @override
  void performLayout() {
    size = computeDryLayout(constraints);
  }
}
