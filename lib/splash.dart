import 'package:flutter/material.dart';
import 'name.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/wall.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                // Top logos
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/FRIT.png', height: 80),
                      Image.asset('assets/unisza.png', height: 50),
                      Image.asset('assets/POLY.png', height: 45),
                    ],
                  ),
                ),
                const Spacer(),

                // Centered sentence and button together
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Test your knowledge of the \nextrusion machine process\nin a fun and interactive way!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: 180,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 236, 212, 74),
                          foregroundColor: const Color.fromARGB(255, 108, 69, 6),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 4,
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const NameScreen()),
                          );
                        },
                        child: const Text(
                          'START',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
