import 'dart:ui' as ui;

import 'package:business_card_app/utils/app_colors.dart';
import 'package:business_card_app/utils/constants.dart';
import 'package:business_card_app/widgets/loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

class QrCodeDialog extends StatefulWidget {
  const QrCodeDialog({super.key});

  @override
  State<QrCodeDialog> createState() => _QrCodeDialogState();
}

class _QrCodeDialogState extends State<QrCodeDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(20),

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
                  color: accentColor.withOpacity(.3),
                  width: 1.5,
                ),
                gradient: LinearGradient(
                  colors: [
                    whiteColor.withOpacity(.08),
                    whiteColor.withOpacity(.04),
                  ],
                ),
              ),
              child: QrImageView(
                size: 200,
                data: '$githubUrl | $linkedinUrl | $email | $phone',
                backgroundColor: primaryColor,
                foregroundColor: accentColor,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () async {
                    try {
                      buildLoadingDialog(context);
                      final qrPainter = QrPainter(
                        data: '$githubUrl | $linkedinUrl | $email | $phone',

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
                  style: ElevatedButton.styleFrom(
                    backgroundColor: accentColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(12),
                    ),
                  ),
                  icon: Icon(Icons.share, color: blackColor),
                  label: Text(
                    "Share",
                    style: TextStyle(
                      color: blackColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                ElevatedButton.icon(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    side: BorderSide(width: 2, color: accentColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(12),
                    ),
                  ),
                  icon: Icon(Icons.close, color: accentColor),
                  label: Text(
                    "Cancel",
                    style: TextStyle(
                      color: accentColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
