import 'package:flutter/material.dart';

class DetailImageSlider extends StatelessWidget {
  final String src;
  const DetailImageSlider({super.key, required this.src});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      src,
      fit: BoxFit.fitHeight,
    );
  }
}
