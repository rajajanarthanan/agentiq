import 'dart:ui';

import 'package:flutter/material.dart';

class LiteGlassContainer extends StatelessWidget {
  final Widget child;
  final double blur;
  final double opacity;
  final Color color;
  final BorderRadius borderRadius;

  const LiteGlassContainer({
    super.key,
    required this.child,
    this.blur = 0.25, // keep it small
    this.opacity = 0.05,
    this.color = Colors.white,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Stack(
        children: [
          // Optional: Avoids full-screen blur cost by using blurred semi-transparent color
          Container(
            decoration: BoxDecoration(
              color: color.withOpacity(opacity), // static semi-transparent fill
              borderRadius: borderRadius,
              border: Border.all(color: Colors.white.withOpacity(0.1)),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
            child: Container(
              color: Colors.transparent, // important: avoid repainting
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
