import 'package:business_card_app/models/user_model.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import 'build_custom_divider.dart';

class NameAndJobTitleSection extends StatelessWidget {
  const NameAndJobTitleSection({super.key, required this.userModel});

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: Duration(seconds: 1),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, 30 * (1 - value)),
          child: Opacity(opacity: value, child: child),
        );
      },
      child: Column(
        children: [
          ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: [accentColor, secondaryAccent],
            ).createShader(bounds),
            child: Text(
              userModel.name,
              style: TextStyle(
                shadows: [
                  Shadow(
                    color: accentColor.withValues(alpha: .6),
                    blurRadius: 15,
                  ),
                  Shadow(
                    color: secondaryAccent.withValues(alpha: .3),
                    blurRadius: 15,
                  ),
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
              border: Border.all(
                color: accentColor.withValues(alpha: .3),
                width: 1.5,
              ),
              gradient: LinearGradient(
                colors: [
                  accentColor.withValues(alpha: .15),
                  secondaryAccent.withValues(alpha: .15),
                ],
              ),
            ),

            child: Text(
              userModel.jobTitle.toUpperCase(),
              style: TextStyle(
                fontSize: 16,
                color: accentColor,
                fontWeight: FontWeight.w700,
                letterSpacing: 3,
              ),
            ),
          ),
          const SizedBox(height: 28),
          BuildCustomDivider(),
        ],
      ),
    );
  }
}
