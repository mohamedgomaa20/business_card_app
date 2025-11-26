import 'dart:ui' as ui;

import 'package:business_card_app/models/user_model.dart';
import 'package:business_card_app/utils/app_colors.dart';
import 'package:business_card_app/widgets/loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

Future showCustomDialog(BuildContext context) {
  return showGeneralDialog(
    context: context,
    transitionDuration: Duration(milliseconds: 400),
    pageBuilder: (context, _, __) {
      return QrCodeDialog(userModel: userModel);
    },

    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return ScaleTransition(
        scale: Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
        ),
        child: FadeTransition(opacity: animation, child: child),
      );
    },
  );
}

class QrCodeDialog extends StatefulWidget {
  const QrCodeDialog({super.key, required this.userModel});

  final UserModel userModel;

  @override
  State<QrCodeDialog> createState() => _QrCodeDialogState();
}

class _QrCodeDialogState extends State<QrCodeDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),

        side: BorderSide(color: accentColor, width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "My QR Code",
              style: TextStyle(
                fontSize: 22,
                color: whiteColor,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: accentColor.withValues(alpha: .3),
                  width: 1.5,
                ),
                gradient: LinearGradient(
                  colors: [
                    whiteColor.withValues(alpha: .08),
                    whiteColor.withValues(alpha: .04),
                  ],
                ),
              ),
              child: QrImageView(
                size: 200,
                data:
                    '${widget.userModel.githubUrl} | ${widget.userModel.linkedinUrl} | ${widget.userModel.email} | ${widget.userModel.phone}',
                backgroundColor: primaryColor,
                foregroundColor: accentColor,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DialogButton(
                  text: "Share",
                  icon: Icons.share,
                  onPressed: () async {
                    try {
                      buildLoadingDialog(context);
                      final qrPainter = QrPainter(
                        data:
                            '${widget.userModel.githubUrl} | ${widget.userModel.linkedinUrl} | ${widget.userModel.email} | ${widget.userModel.phone}',
                        version: QrVersions.auto,
                        gapless: true,
                        color: accentColor,
                        emptyColor: primaryColor,
                      );

                      final image = await qrPainter.toImage(500);
                      final byteData = await image.toByteData(
                        format: ui.ImageByteFormat.png,
                      );
                      if (mounted) Navigator.pop(context);
                      if (byteData != null) {
                        await Share.shareXFiles([
                          XFile.fromData(
                            byteData.buffer.asUint8List(),
                            mimeType: "image/png",
                            name: "Mohamed_Gomaa_QR.png",
                          ),
                        ], text: "My QR Code - Business Card");
                      }
                    } catch (error) {
                      if (mounted) {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Error while sharing: $error"),
                          ),
                        );
                      }
                    }
                  },
                  isPrimary: true,
                ),
                DialogButton(
                  text: "cancel",
                  onPressed: () => Navigator.pop(context),
                  isPrimary: false,
                  icon: Icons.close,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DialogButton extends StatelessWidget {
  const DialogButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isPrimary = false,
    required this.icon,
  });

  final String text;
  final VoidCallback onPressed;
  final bool isPrimary;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isPrimary ? accentColor : Colors.transparent,
        side: BorderSide(width: 2, color: accentColor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      icon: Icon(icon, color: isPrimary ? blackColor : accentColor),
      label: Text(
        text,
        style: TextStyle(
          color: isPrimary ? blackColor : accentColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
