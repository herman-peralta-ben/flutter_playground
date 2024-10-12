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
        Text(text,style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent)),
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
