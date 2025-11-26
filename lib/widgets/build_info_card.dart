import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class BuildInfoCard extends StatefulWidget {
  const BuildInfoCard({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
    required this.delay,
  });

  final IconData icon;
  final String text;
  final VoidCallback onTap;
  final int delay;

  @override
  State<BuildInfoCard> createState() => _BuildInfoCardState();
}

class _BuildInfoCardState extends State<BuildInfoCard>
    with TickerProviderStateMixin {
  late AnimationController pressController;
  late Animation<double> pressAnimation;

  late AnimationController animationController;
  late Animation<Offset> slideAnimation;
  late Animation<double> scaleAnimation;
  late Animation<double> opacityAnimation;

  @override
  void initState() {
    pressController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    pressAnimation = Tween<double>(begin: 1, end: 0.90).animate(
      CurvedAnimation(
        parent: pressController,
        curve: Curves.easeOut,
        reverseCurve: Curves.elasticOut,
      ),
    );

    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1200),
    );
    slideAnimation = Tween<Offset>(begin: Offset(1, 0), end: Offset.zero)
        .animate(
          CurvedAnimation(parent: animationController, curve: Curves.easeOutBack),
        );

    scaleAnimation = Tween<double>(begin: .95, end: 1).animate(
      CurvedAnimation(parent: animationController, curve: Curves.elasticOut),
    );

    opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeIn),
    );
    Future.delayed(Duration(milliseconds: widget.delay+100), () {
      if (mounted) animationController.forward();
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    pressController.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return SlideTransition(
          position: slideAnimation,
          child: ScaleTransition(
            scale: scaleAnimation,
            child: Opacity(opacity: opacityAnimation.value, child: child),
          ),
        );
      },

      child: GestureDetector(
        onTapDown: (_) => pressController.forward(),
        onTapUp: (_) => pressController.reverse(),
        onTapCancel: () => pressController.reverse(),
        onTap: widget.onTap,

        child: ScaleTransition(
          scale: pressAnimation,

          child: Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.1),
                width: 1.5,
              ),
              gradient: LinearGradient(
                colors: [
                  accentColor.withValues(alpha: .05),
                  accentColor.withValues(alpha: 0.02),
                ],
              ),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 20,
              ),
              leading: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      accentColor.withValues(alpha: .2),
                      accentColor.withValues(alpha: .1),
                    ],
                  ),
                ),
                child: Icon(widget.icon, color: accentColor, size: 28),
              ),
              title: Text(
                widget.text,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: whiteColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
