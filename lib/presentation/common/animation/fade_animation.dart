import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  const FadeAnimation(this.delay, this.child, {super.key});

  @override
  Widget build(BuildContext context) {
    // Định nghĩa tween cho opacity
    final opacityTween = Tween<double>(begin: 0.0, end: 1.0);
    // Định nghĩa tween cho translateY
    final translateYTween = Tween<double>(begin: -30.0, end: 0.0);

    return CustomAnimationBuilder(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: const Duration(milliseconds: 500),
      tween: opacityTween,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, translateYTween.transform(value)),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}
