import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CircleGradient extends StatelessWidget {
  const CircleGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            accentColor.withValues(alpha: .1),
            accentColor.withValues(alpha: 0),
          ],
        ),
      ),
    );
  }
}
