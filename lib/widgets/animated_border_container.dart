import 'package:agentiq/resources/colorscheme.dart';
import 'package:flutter/material.dart';

class AnimatedBorderContainer extends StatefulWidget {
  const AnimatedBorderContainer({
    super.key,
    required this.child,
    this.borderColors = const [AppColors.limeGlow, AppColors.logoColor5],
    this.padding = const EdgeInsets.all(16),
  });
  final Widget child;
  final List<Color> borderColors;
  final EdgeInsets padding;

  @override
  State<AnimatedBorderContainer> createState() =>
      _AnimatedBorderContainerState();
}

class _AnimatedBorderContainerState extends State<AnimatedBorderContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(); // infinite loop
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        painter: MovingGradientBorderPainter(
          animation: _controller,
          borderColors: widget.borderColors,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [BoxShadow(color: Colors.black87, blurRadius: 10)],
          ),
          alignment: Alignment.center,
          // padding: widget.padding,
          child: widget.child,

          // const Text(
          //   'CSSScript',
          //   style: TextStyle(
          //     fontSize: 20,
          //     color: Colors.pinkAccent,
          //     fontWeight: FontWeight.w600,
          //     letterSpacing: 2,
          //   ),
          // ),
        ),
      ),
    );
  }
}

class MovingGradientBorderPainter extends CustomPainter {
  final Animation<double> animation;
  final List<Color> borderColors;
  MovingGradientBorderPainter({
    required this.animation,
    required this.borderColors,
  }) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    const borderWidth = 3.0;
    final rect = Offset.zero & size;

    final paint =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = borderWidth;

    // Path of the border
    final path =
        Path()
          ..addRRect(RRect.fromRectAndRadius(rect, const Radius.circular(20)));

    // Path metrics for extracting animated segment
    final metrics = path.computeMetrics().toList();
    if (metrics.isEmpty) return;

    final metric = metrics.first;
    final length = metric.length;
    final animationOffset = animation.value * length;

    final extractLength = length * 0.15; // visible length of glow

    final extractPath = metric.extractPath(
      animationOffset,
      (animationOffset + extractLength) % length,
    );

    paint.shader = LinearGradient(colors: borderColors).createShader(rect);

    canvas.drawPath(extractPath, paint);
  }

  @override
  bool shouldRepaint(covariant MovingGradientBorderPainter oldDelegate) => true;
}
