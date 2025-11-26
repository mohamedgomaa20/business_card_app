import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class BuildCustomDivider extends StatelessWidget {
  const BuildCustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: [
            accentColor,
            secondaryAccent,
            secondaryAccent.withValues(alpha: .3),
          ],
        ),
      ),
    );
  }
}
