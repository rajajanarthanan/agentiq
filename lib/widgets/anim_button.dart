import 'package:agentiq/resources/colorscheme.dart';
import 'package:agentiq/widgets/animated_border_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zo_animated_border/zo_animated_border.dart';

class AnimButton extends StatelessWidget {
  const AnimButton({
    super.key,
    this.text,
    required this.onPress,
    this.icon,
    this.child,
  });
  final String? text;
  final Function() onPress;
  final IconData? icon;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ZoAnimatedGradientBorder(
      glowOpacity: 0.125,
      borderRadius: 100,
      borderThickness: 2,
      gradientColor: [
        // AppColors.limeGlow,
        AppColors.limeGlow,
        const Color.fromARGB(255, 1, 5, 245),
        // const Color.fromARGB(255, 0, 90, 71),
        // const Color.fromARGB(255, 0, 255, 55),
      ],
      // duration: Duration(seconds: 4),
      child: ElevatedButton(
        onPressed: onPress,
        child:
            icon != null
                ? Row(children: [Icon(icon), child ?? Text(text ?? "")])
                : child ?? Text(text ?? ""),
      ),
    );
  }
}
