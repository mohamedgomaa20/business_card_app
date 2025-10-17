import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../utils/app_colors.dart';

Future<dynamic> buildLoadingDialog(context) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return Dialog(
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LoadingAnimationWidget.staggeredDotsWave(
                color: accentColor,
                size: 50,
              ),
              SizedBox(height: 20),
              Text(
                "Preparing the share...",
                style: TextStyle(color: whiteColor, fontSize: 18),
              ),
            ],
          ),
        ),
      );
    },
  );
}
