import 'package:flutter/material.dart';

import 'screens/business_card_app_screen.dart';

void main() {
  runApp(const BirthDayCard());
}

class BirthDayCard extends StatelessWidget {
  const BirthDayCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BusinessCardAppScreen(),
    );
  }
}
