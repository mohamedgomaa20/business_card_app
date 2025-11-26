import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    required this.icon,
    required this.text,
    required this.isPrimary,
    required this.onTap,
    required this.delay,
  });

  final IconData icon;
  final String text;
  final bool isPrimary;
  final int delay;

  final VoidCallback onTap;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton>
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

      ),
    );

    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1200),
    );
    slideAnimation = Tween<Offset>(begin: Offset(1, 0), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: animationController,
            curve: Curves.easeOutBack,
          ),
        );

    scaleAnimation = Tween<double>(begin: .9, end: 1).animate(
      CurvedAnimation(parent: animationController, curve: Curves.elasticOut),
    );

    opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeIn),
    );
    Future.delayed(Duration(milliseconds: widget.delay + 100), () {
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
          child: Transform.scale(
            scale: scaleAnimation.value,
            child: Opacity(opacity: opacityAnimation.value, child: child),
          ),
        );
      },
      child: GestureDetector(
        onTapDown: (_)=> pressController.forward(),
        onTapUp: (_)=> pressController.reverse(),
        onTapCancel: () => pressController.reverse(),
        onTap: widget.onTap,
        child: ScaleTransition(
         scale: pressAnimation,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: !widget.isPrimary
                  ? Border.all(color: accentColor.withValues(alpha: .5), width: 2)
                  : null,

              gradient: widget.isPrimary
                  ? LinearGradient(
                      colors: [accentColor, accentColor.withValues(alpha: .8)],
                    )
                  : null,
              boxShadow: widget.isPrimary
                  ? [
                      BoxShadow(
                        color: accentColor.withValues(alpha: .4),
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
                Icon(
                  widget.icon,
                  color: widget.isPrimary ? whiteColor : accentColor,
                  size: 22,
                ),
                SizedBox(width: 10),
                Text(
                  widget.text,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,

                    color: widget.isPrimary ? whiteColor : accentColor,
                    letterSpacing: .8,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
