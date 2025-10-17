import 'package:business_card_app/utils/constants.dart';
import 'package:business_card_app/widgets/build_custom_divider.dart';
import 'package:business_card_app/widgets/build_image_section.dart';
import 'package:business_card_app/widgets/build_info_card.dart';
import 'package:business_card_app/widgets/custom_button.dart';
import 'package:business_card_app/widgets/name_and_job_title_section.dart';
import 'package:business_card_app/widgets/qr_code_dialog.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class BusinessCardAppScreen extends StatelessWidget {
  const BusinessCardAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void _showQRCodeDialog() {
      showDialog(
        context: context,
        builder: (context) {
          return QrCodeDialog();
        },
      );
    }

    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  primaryColor,
                  primaryColor.withOpacity(.8),
                  const Color(0xFF1a2332),
                ],
              ),
            ),
          ),
          Positioned(
            top: -50,
            right: -50,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    accentColor.withOpacity(.1),
                    accentColor.withOpacity(0),
                  ],
                ),
              ),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Center(
                  child: Column(
                    children: [
                      BuildImageSection(),
                      const SizedBox(height: 32),
                      NameAndJobTitleSection(),
                      const SizedBox(height: 28),
                      BuildCustomDivider(),
                      const SizedBox(height: 32),
                      BuildInfoCard(icon: Icons.call, text: phone),
                      BuildInfoCard(icon: Icons.mail_rounded, text: email),
                      BuildInfoCard(icon: Icons.code_rounded, text: githubUrl),
                      BuildInfoCard(
                        icon: Icons.business_rounded,
                        text: linkedinUrl,
                      ),
                      const SizedBox(height: 36),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomButton(
                            icon: Icons.qr_code_2_outlined,
                            text: "QR Code",
                            isPrimary: true,
                            onTap: () => _showQRCodeDialog(),
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
    );
  }
}
