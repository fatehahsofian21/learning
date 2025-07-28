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
            // Fullscreen background image using BoxDecoration
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/wall1.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),

            // Content layer
            Column(
              children: [
                const SizedBox(height: 40), // top spacing

                const Spacer(),

                // Center content
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        'Test your knowledge of the \nextrusion machine process\nin a fun and interactive way!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: 180,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 236, 212, 74),
                          foregroundColor: Color.fromARGB(255, 108, 69, 6),
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
