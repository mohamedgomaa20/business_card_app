import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class BuildImageSection extends StatelessWidget {
  const BuildImageSection({super.key, required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 800),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Opacity(opacity: value, child: child),
        );
      },
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [accentColor, secondaryAccent],
          ),
          boxShadow: [
            BoxShadow(
              color: accentColor.withOpacity(.4),
              blurRadius: 40,
              spreadRadius: 5,
              offset: Offset(0, 15),
            ),
            BoxShadow(
              color: secondaryAccent.withOpacity(.2),
              blurRadius: 20,
              spreadRadius: -5,
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: primaryColor,
          ),
          child: CircleAvatar(
            radius: 75,
            backgroundImage: AssetImage(imagePath),
          ),
        ),
      ),
    );
  }
}
