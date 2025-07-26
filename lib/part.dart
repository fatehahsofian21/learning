import 'package:flutter/material.dart';

class PartScreen extends StatelessWidget {
  const PartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF1D6),
      body: SafeArea(
        child: Column(
          children: [
            // Top Logos (exact same size as SplashScreen)
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/FRIT.png', height: 80),
                  Image.asset('assets/unisza.png', height: 40),
                  Image.asset('assets/POLY.png', height: 40),
                ],
              ),
            ),

            // Spacer for clean empty screen
            const Expanded(
              child: SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
