 import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class NameAndJobTitleSection extends StatelessWidget {
  const NameAndJobTitleSection({
    super.key,
    required this.name,
    required this.jobTitle,
  });

  final String name;
  final String jobTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: [accentColor, secondaryAccent],
          ).createShader(bounds),
          child: Text(
            name,
            style: TextStyle(
              shadows: [
                Shadow(color: accentColor.withOpacity(.6), blurRadius: 15),
                Shadow(color: secondaryAccent.withOpacity(.3), blurRadius: 15),
              ],
              fontFamily: "Raleway",
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: whiteColor,
              letterSpacing: 1.5,
            ),
          ),
        ),

        const SizedBox(height: 12),

        Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: accentColor.withOpacity(.3), width: 1.5),
            gradient: LinearGradient(
              colors: [
                accentColor.withOpacity(.15),
                secondaryAccent.withOpacity(.15),
              ],
            ),
          ),

          child: Text(
            jobTitle.toUpperCase(),
            style: TextStyle(
              fontSize: 16,
              color: accentColor,
              fontWeight: FontWeight.w700,
              letterSpacing: 3,
            ),
          ),
        ),
      ],
    );
  }
}
