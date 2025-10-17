import 'package:business_card_app/utils/constants.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class BuildImageSection extends StatelessWidget {
  const BuildImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        decoration: BoxDecoration(shape: BoxShape.circle, color: primaryColor),
        child: CircleAvatar(
          radius: 75,
          backgroundImage: AssetImage(imagePath),
        ),
      ),
    );
  }
}
