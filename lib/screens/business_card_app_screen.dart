import 'package:business_card_app/widgets/build_custom_divider.dart';
import 'package:business_card_app/widgets/build_image_section.dart';
import 'package:business_card_app/widgets/build_info_card.dart';
import 'package:business_card_app/widgets/custom_button.dart';
import 'package:business_card_app/widgets/name_and_job_title_section.dart';
import 'package:business_card_app/widgets/qr_code_dialog.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/user_model.dart';
import '../utils/app_colors.dart';

class BusinessCardAppScreen extends StatelessWidget {
  const BusinessCardAppScreen({super.key});

  final UserModel userModel = const UserModel(
    githubUrl: 'https://github.com/mohamedgomaa20',
    linkedinUrl: 'https://www.linkedin.com/in/mohamed-gomaa-874133284',
    email: '20monagy@gmail.com',
    phone: '(+20) 1002418816',
    name: 'Mohamed Gomaa',
    jobTitle: 'Flutter Developer',
    imagePath: "assets/images/free_p.jpg",
  );

  void _showQRCodeDialog(context) {
    showDialog(
      context: context,
      builder: (context) {
        return QrCodeDialog(userModel: userModel);
      },
    );
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              primaryColor,
              primaryColor.withValues(alpha: .8),
              darkGray,
            ],
          ),
        ),

        child: Stack(
          children: [
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
                        const SizedBox(height: 36),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomButton(
                              icon: Icons.qr_code_2_outlined,
                              text: "QR Code",
                              isPrimary: true,
                              onTap: () => _showQRCodeDialog(context),
                            ),
                            const SizedBox(width: 16),
                            CustomButton(
                              icon: Icons.download_rounded,
                              text: "DownLoad",
                              isPrimary: false,
                              onTap: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container CircleGradient() {
    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            accentColor.withValues(alpha: .1),
            accentColor.withValues(alpha: 0),
          ],
        ),
      ),
    );
  }
}
