import 'package:business_card_app/widgets/qr_code_dialog.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';
import 'custom_button.dart';

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  void _showQRCodeDialog(context) {
    showDialog(
      context: context,
      builder: (context) {
        return QrCodeDialog(userModel: userModel);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButton(
          icon: Icons.qr_code_2_outlined,
          text: "QR Code",
          isPrimary: true,
          delay: 150,
          onTap: () => showCustomDialog(context),
        ),
        const SizedBox(width: 16),
        CustomButton(
          icon: Icons.download_rounded,
          text: "DownLoad",
          isPrimary: false,
          delay: 400,
          onTap: () {},
        ),
      ],
    );
  }
}
