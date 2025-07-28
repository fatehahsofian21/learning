import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'quiz1.dart';

class QuizSplashScreen extends StatelessWidget {
  const QuizSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/Y.jpg"), // Background wallpaper
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 20), // Move content upward
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Lottie Animation
                Lottie.asset(
                  'assets/animations/quiz.json',
                  height: 180,
                  repeat: true,
                ),

                const SizedBox(height: 10),

                // Rules Box
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "📘 QUIZ RULES",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                          "✅ Read the instructions carefully before answering each question."),
                      Text(
                          "✍️ Use a blue or black pen only (for handwritten sections)."),
                      Text(
                          "⏰ Answer within the given time. Late submissions will not be accepted."),
                      Text(
                          "🚫 Mobile phones or external aids are not allowed."),
                      Text(
                          "🙅 No talking or discussing with peers during the quiz."),
                      Text("📝 Review your answers before submitting."),
                      Text(
                          "⚠️ Plagiarism or cheating will result in mark deduction or disqualification."),
                      Text(
                          "🧠 Use polite and complete language in your answers."),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                // BACK and NEXT Buttons
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // BACK button
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_ios,
                            color: Colors.white, size: 18),
                        label: const Text(
                          'BACK',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      // NEXT button
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 153, 216, 81),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Quiz1Page(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.arrow_forward_ios,
                            color: Colors.white, size: 18),
                        label: const Text(
                          'NEXT',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
