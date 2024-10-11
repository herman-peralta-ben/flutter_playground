import 'package:flutter/material.dart';

class SwitchItem extends StatelessWidget {
  final String text;
  final bool value;
  final Function(bool) onChanged;
  const SwitchItem({
    super.key,
    required this.text,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.blueAccent)),
        Switch(
          value: value,
          onChanged: onChanged,
        ),
      ],
    );
  }
}

class SlowFadeImage extends StatelessWidget {
  final String imageUrl;
  const SlowFadeImage(this.imageUrl, {super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInImage.assetNetwork(
      placeholder: "assets/background.jpg",
      image: imageUrl,
      fadeOutDuration: const Duration(milliseconds: 3000),
      fadeInDuration: const Duration(milliseconds: 3000),
    );
  }
}

class ExampleCard extends StatelessWidget {
  final String title;
  final Widget child;
  final bool useRepaintBoundary;
  const ExampleCard({
    super.key,
    required this.title,
    required this.child,
    this.useRepaintBoundary = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, color: Colors.blueAccent),
              textAlign: TextAlign.center,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(),
            ),
            useRepaintBoundary ? RepaintBoundary(child: child) : child,
          ],
        ),
      ),
    );
  }
}
