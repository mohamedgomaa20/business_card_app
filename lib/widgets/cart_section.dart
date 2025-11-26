import 'package:business_card_app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'build_info_card.dart';

class CartSection extends StatelessWidget {
  const CartSection({super.key, required this.userModel});

  final UserModel userModel;

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BuildInfoCard(
          icon: Icons.call,
          text: userModel.phone,
          delay: 0,
          onTap: () {
            _launchUrl('tel:${userModel.phone}');
          },
        ),
        BuildInfoCard(
          icon: Icons.mail_rounded,
          text: userModel.email,
          delay: 150,
          onTap: () {
            _launchUrl('mailto:${userModel.email}');
          },
        ),
        BuildInfoCard(
          icon: Icons.code_rounded,
          text: userModel.githubUrl,
          delay: 300,
          onTap: () {
            _launchUrl(userModel.githubUrl);
          },
        ),
        BuildInfoCard(
          icon: Icons.business_rounded,
          text: userModel.linkedinUrl,
          delay: 450,
          onTap: () {
            _launchUrl(userModel.linkedinUrl);
          },
        ),
      ],
    );
  }
}
