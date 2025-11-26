import 'package:business_card_app/widgets/build_image_section.dart';
import 'package:business_card_app/widgets/button_section.dart';
import 'package:business_card_app/widgets/cart_section.dart';
import 'package:business_card_app/widgets/name_and_job_title_section.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';
import '../utils/app_colors.dart';
import '../widgets/circle_gradient.dart';
import '../widgets/gradient_background.dart';

class BusinessCardAppScreen extends StatelessWidget {
  const BusinessCardAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        children: [
          GradientBackground(),
          Positioned(top: -50, right: -50, child: CircleGradient()),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Center(
                  child: Column(
                    children: [
                      BuildImageSection(imagePath: userModel.imagePath),
                      const SizedBox(height: 32),
                      NameAndJobTitleSection(userModel: userModel),
                      const SizedBox(height: 32),
                      CartSection(userModel: userModel),
                      const SizedBox(height: 36),
                      ButtonSection(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
