import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class BuildInfoCard extends StatelessWidget {
  const BuildInfoCard({super.key, required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withOpacity(0.1), width: 1.5),
          gradient: LinearGradient(
            colors: [
              accentColor.withOpacity(.05),
              accentColor.withOpacity(0.02),
            ],
          ),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          leading: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  accentColor.withOpacity(.2),
                  accentColor.withOpacity(.1),
                ],
              ),
            ),
            child: Icon(icon, color: accentColor, size: 28),
          ),
          title: Text(
            text,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
