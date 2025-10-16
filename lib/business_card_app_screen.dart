import 'package:flutter/material.dart';

class BusinessCardAppScreen extends StatelessWidget {
  const BusinessCardAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF0F1419);
    const Color accentColor = Color(0xFF00D9FF);
    const Color secondaryAccent = Color(0xFF00B894);

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

                      Card(
                        color: Colors.white,

                        margin: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const ListTile(
                          leading: Icon(
                            Icons.call,
                            size: 30,
                            color: Color(0xFF2b455f),
                          ),
                          title: Text(
                            "(+20) 1002418816",
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                      ),

                      Card(
                        color: Colors.white,

                        margin: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const ListTile(
                          leading: Icon(
                            Icons.mail,
                            size: 30,
                            color: Color(0xFF2b455f),
                          ),
                          title: Text(
                            "20monagy@gmail.com",
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
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
