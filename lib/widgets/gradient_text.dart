import 'package:agentiq/resources/colorscheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GradientText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Gradient gradient;

  const GradientText({
    super.key,
    required this.text,
    required this.style,
    this.gradient = AppColors.agentiqGradient,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback:
          (bounds) => gradient.createShader(
            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
          ),
      child: Text(text, style: style.copyWith(color: Colors.white)),
    );
  }
}
