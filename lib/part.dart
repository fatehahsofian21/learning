import 'package:flutter/material.dart';
import 'quizScreen.dart'; // make sure this file exists

class PartScreen extends StatelessWidget {
  const PartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF1D6),
      body: SafeArea(
        child: Stack(
          children: [
            // Column content
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Logos
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24.0, vertical: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/FRIT.png', height: 80),
                      Image.asset('assets/unisza.png', height: 40),
                      Image.asset('assets/POLY.png', height: 40),
                    ],
                  ),
                ),

                // Spacer to push content down
                const Spacer(),

                // Sentence and image right above the button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "There are 10 dots, kindly tap on it",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.w600,
                          height: 0.9,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Center(
                        child: Stack(
                          children: [
                            Image.asset(
                              'assets/mesen.png',
                              width: 350,
                              fit: BoxFit.contain,
                            ),
                            // Yellow dots
                            Positioned(left: 160, top: 10, child: buildDot()),
                            Positioned(left: 150, top: 75, child: buildDot()),
                            Positioned(left: 180, top: 100, child: buildDot()),
                            Positioned(left: 240, top: 110, child: buildDot()),
                            Positioned(left: 295, top: 110, child: buildDot()),
                            Positioned(left: 230, top: 155, child: buildDot()),
                            Positioned(left: 130, top: 155, child: buildDot()),
                            Positioned(left: 60, top: 115, child: buildDot()),
                            Positioned(left: 50, top: 160, child: buildDot()),
                            Positioned(left: 10, top: 153, child: buildDot()),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Next button - bottom right
            Positioned(
              bottom: 15,
              right: 20,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const QuizSplashScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 153, 216, 81),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(
                      fontSize: 14, color: Color.fromARGB(255, 15, 71, 23)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget buildDot() {
    return GestureDetector(
      onTap: () {
        // Optional: logic here
      },
      child: Container(
        width: 13,
        height: 13,
        decoration: BoxDecoration(
          color: Colors.yellow,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black),
        ),
      ),
    );
  }
}
