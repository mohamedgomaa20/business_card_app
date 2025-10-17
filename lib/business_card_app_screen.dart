import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

class BusinessCardAppScreen extends StatefulWidget {
  const BusinessCardAppScreen({super.key});

  @override
  State<BusinessCardAppScreen> createState() => _BusinessCardAppScreenState();
}

class _BusinessCardAppScreenState extends State<BusinessCardAppScreen> {
  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF0F1419);
    const Color accentColor = Color(0xFF00D9FF);
    const Color secondaryAccent = Color(0xFF00B894);
    void _showQRCodeDialog(Color accentColor) {
      showDialog(
        context: context,
        builder: (context) {
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
                      color: Colors.white,
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
                          Colors.white.withOpacity(.08),
                          Colors.white.withOpacity(.04),
                        ],
                      ),
                    ),
                    child: QrImageView(
                      size: 200,
                      data:
                          'https://github.com/mohamedgomaa20 | linkedin.com/in/mohamed-ali-ahmed | 20monagy@gmail.com | (+20) 1002418816',
                      backgroundColor: const Color(0xFF0F1419),
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
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) {
                                return Dialog(
                                  backgroundColor: primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        CircularProgressIndicator(
                                          valueColor: AlwaysStoppedAnimation(
                                            accentColor,
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        Text(
                                          "Preparing the share...",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                            final qrPainter = QrPainter(
                              data:
                                  'https://github.com/mohamedgomaa20 | https://www.linkedin.com/in/mohamed-gomaa-874133284 | 20monagy@gmail.com | (+20) 1002418816',

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
                            print(error);
                            if (mounted) {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Error $error")),
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

                        icon: Icon(Icons.share, color: Colors.black),
                        label: Text(
                          "Share",
                          style: TextStyle(
                            color: Colors.black,
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
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [accentColor, secondaryAccent],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: accentColor.withOpacity(.4),
                              blurRadius: 40,
                              spreadRadius: 5,
                              offset: Offset(0, 15),
                            ),
                            BoxShadow(
                              color: secondaryAccent.withOpacity(.2),
                              blurRadius: 20,
                              spreadRadius: -5,
                            ),
                          ],
                        ),
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: primaryColor,
                          ),
                          child: CircleAvatar(
                            radius: 75,
                            backgroundImage: AssetImage(
                              "assets/images/free_p.jpg",
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),

                      ShaderMask(
                        shaderCallback: (bounds) => LinearGradient(
                          colors: [accentColor, secondaryAccent],
                        ).createShader(bounds),
                        child: Text(
                          "Mohamed Gomaa",
                          style: TextStyle(
                            shadows: [
                              Shadow(
                                color: accentColor.withOpacity(.6),
                                blurRadius: 15,
                              ),
                              Shadow(
                                color: secondaryAccent.withOpacity(.3),
                                blurRadius: 15,
                              ),
                            ],
                            fontFamily: "Pacifico",
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),

                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 24,
                        ),

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: accentColor.withOpacity(.3),
                            width: 1.5,
                          ),
                          gradient: LinearGradient(
                            colors: [
                              accentColor.withOpacity(.15),
                              secondaryAccent.withOpacity(.15),
                            ],
                          ),
                        ),

                        child: Text(
                          "Flutter Developer".toUpperCase(),
                          style: TextStyle(
                            fontSize: 16,
                            color: accentColor,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 3,
                          ),
                        ),
                      ),

                      const SizedBox(height: 28),
                      Container(
                        width: 80,
                        height: 3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: [
                              accentColor,
                              secondaryAccent,
                              secondaryAccent.withOpacity(.3),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),

                      BuildInfoCard(
                        icon: Icons.call,
                        text: "(+20) 1002418816",
                        accentColor: accentColor,
                        primaryColor: primaryColor,
                        onTap: () {},
                      ),
                      BuildInfoCard(
                        icon: Icons.mail_rounded,
                        text: "20monagy@gmail.com",
                        accentColor: accentColor,
                        primaryColor: primaryColor,
                        onTap: () {},
                      ),
                      BuildInfoCard(
                        icon: Icons.code_rounded,
                        text: "github.com/mohamedgomaa20",
                        accentColor: accentColor,
                        primaryColor: primaryColor,
                        onTap: () {},
                      ),
                      BuildInfoCard(
                        icon: Icons.business_rounded,
                        text:
                            "https://www.linkedin.com/in/mohamed-gomaa-874133284",
                        accentColor: accentColor,
                        primaryColor: primaryColor,
                        onTap: () {},
                      ),
                      const SizedBox(height: 36),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomButton(
                            icon: Icons.qr_code_2_outlined,
                            text: "QR Code",
                            accentColor: accentColor,
                            isPrimary: true,
                            onTap: () => _showQRCodeDialog(accentColor),
                          ),
                          const SizedBox(width: 16),

                          CustomButton(
                            icon: Icons.download_rounded,
                            text: "DownLoad",
                            accentColor: accentColor,
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

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.icon,
    required this.text,
    required this.accentColor,
    required this.isPrimary,
    required this.onTap,
  });

  final IconData icon;
  final String text;
  final Color accentColor;
  final bool isPrimary;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: !isPrimary
              ? Border.all(color: accentColor.withOpacity(.5), width: 2)
              : null,

          gradient: isPrimary
              ? LinearGradient(
                  colors: [accentColor, accentColor.withOpacity(.8)],
                )
              : null,
          boxShadow: isPrimary
              ? [
                  BoxShadow(
                    color: accentColor.withOpacity(.4),
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
            Icon(icon, color: isPrimary ? Colors.white : accentColor, size: 22),
            SizedBox(width: 10),
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,

                color: isPrimary ? Colors.white : Colors.cyanAccent,
                letterSpacing: .8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BuildInfoCard extends StatelessWidget {
  const BuildInfoCard({
    super.key,
    required this.icon,
    required this.text,
    required this.accentColor,
    required this.primaryColor,
    required this.onTap,
  });

  final IconData icon;
  final String text;
  final Color accentColor;
  final Color primaryColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withOpacity(0.1), width: 1.5),
          gradient: LinearGradient(
            colors: [
              accentColor.withOpacity(.05),
              accentColor.withOpacity(0.02),
            ],
          ),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          leading: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  accentColor.withOpacity(.2),
                  accentColor.withOpacity(.1),
                ],
              ),
            ),
            child: Icon(icon, color: accentColor, size: 28),
          ),
          title: Text(
            text,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
