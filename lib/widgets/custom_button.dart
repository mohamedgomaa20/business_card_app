import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.icon,
    required this.text,
    required this.isPrimary,
    required this.onTap,
  });

  final IconData icon;
  final String text;
  final bool isPrimary;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: !isPrimary
              ? Border.all(color: accentColor.withOpacity(.5), width: 2)
              : null,

          gradient: isPrimary
              ? LinearGradient(
                  colors: [accentColor, accentColor.withOpacity(.8)],
                )
              : null,
          boxShadow: isPrimary
              ? [
                  BoxShadow(
                    color: accentColor.withOpacity(.4),
                    blurRadius: 20,
                    offset: Offset(0, 8),
                  ),
                ]
              : [],
        ),
        padding: EdgeInsets.symmetric(horizontal: 28, vertical: 14),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: isPrimary ? whiteColor : accentColor, size: 22),
            SizedBox(width: 10),
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,

                color: isPrimary ? whiteColor : accentColor,
                letterSpacing: .8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
