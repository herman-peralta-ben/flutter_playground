import 'package:flutter/material.dart';
import 'package:flutter_playground/examples/ui/render_object_example/custom_circular_progress_indicator.dart';

enum AnimationType {
  once,
  repeat,
  repeatInverse;
}

class AnimatedCircularProgressIndicator extends StatefulWidget {
  final double value; // Progress value between 0.0 and 1.0
  final Color color; // Color of the progress indicator
  final double strokeWidth; // Stroke width of the progress indicator
  final AnimationType animationType;
  final Duration animationDuration;

  const AnimatedCircularProgressIndicator({
    super.key,
    required this.value,
    this.color = Colors.blue,
    this.strokeWidth = 4.0,
    this.animationType = AnimationType.repeat,
    this.animationDuration = const Duration(seconds: 3),
  });

  @override
  AnimatedCircularProgressIndicatorState createState() => AnimatedCircularProgressIndicatorState();
}

class AnimatedCircularProgressIndicatorState extends State<AnimatedCircularProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller, pass the desired value and durations
    _controller = AnimationController(
      value: widget.value,
      vsync: this,
      duration: widget.animationDuration, // Set animation duration
    );

    // Define a Tween to animate the progress value between 0.0 and 1.0
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    // Start the animation
    switch (widget.animationType) {
      case AnimationType.once:
        _controller.forward();
        break;
      case AnimationType.repeat:
        _controller.repeat();
        break;
      case AnimationType.repeatInverse:
        _controller.forward();
        _controller.addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            _controller.reverse(); // Reverse the animation when it completes
          } else if (status == AnimationStatus.dismissed) {
            _controller.forward(); // Forward the animation when it dismisses
          }
        });
        break;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO need to check how to properly manage the size (get the parent widget size), this breaks RepaintBoundary
    /*return RepaintBoundary(
      child: CustomCircularProgressIndicatorWidget(
        value: _animation.value,
        color: widget.color,
        strokeWidth: widget.strokeWidth,
      ),
    );*/
    return CustomCircularProgressIndicatorWidget(
      value: _animation.value,
      color: widget.color,
      strokeWidth: widget.strokeWidth,
    );
  }
}
