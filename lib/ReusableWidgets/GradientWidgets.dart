import 'package:flutter/material.dart';

class LinearGradientItens extends StatelessWidget {
  LinearGradientItens({@required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          colors: [Colors.blue, Colors.green],
        ).createShader(bounds);
      },
      child: child,
    );
  }
}
