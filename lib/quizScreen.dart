import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:lottie/lottie.dart';
import 'quiz1.dart';

class QuizSplashScreen extends StatefulWidget {
  const QuizSplashScreen({super.key});

  @override
  State<QuizSplashScreen> createState() => _QuizSplashScreenState();
}

class _QuizSplashScreenState extends State<QuizSplashScreen> {
  final FlutterTts flutterTts = FlutterTts();
  int currentIndex = -1;
  bool isReading = false;

  final List<String> rules = [
    "📝 Read all instructions carefully before starting the quiz.",
    "🖊️ Use a blue or black pen only (for handwritten sections).",
    "⏰ Answer within the given time. Late submissions will not be accepted.",
    "📵 Mobile phones or external aids are not allowed.",
    "🔇 No talking or discussing with peers during the quiz.",
    "🔁 Review your answers before submitting.",
    "❌ Plagiarism or cheating will result in mark deduction or disqualification.",
    "🗣️ Use polite and complete language in your answers.",
  ];

  final List<String> ruleTextsOnly = [
    "Read all instructions carefully before starting the quiz.",
    "Use a blue or black pen only for handwritten sections.",
    "Answer within the given time. Late submissions will not be accepted.",
    "Mobile phones or external aids are not allowed.",
    "No talking or discussing with peers during the quiz.",
    "Review your answers before submitting.",
    "Plagiarism or cheating will result in mark deduction or disqualification.",
    "Use polite and complete language in your answers.",
  ];

  @override
  void initState() {
    super.initState();
    flutterTts.setSpeechRate(0.5);
    flutterTts.setPitch(1.0);
    flutterTts.setCompletionHandler(() {
      if (isReading && currentIndex + 1 < ruleTextsOnly.length) {
        setState(() {
          currentIndex++;
        });
        flutterTts.speak(ruleTextsOnly[currentIndex]);
      } else {
        setState(() {
          isReading = false;
          currentIndex = -1;
        });
      }
    });
  }

  Future<void> handleTtsToggle() async {
    if (isReading) {
      await flutterTts.stop();
      setState(() {
        isReading = false;
        currentIndex = -1;
      });
    } else {
      await flutterTts.stop();
      setState(() {
        isReading = true;
        currentIndex = 0;
      });
      await flutterTts.speak(ruleTextsOnly[0]);
    }
  }

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }

  Widget buildRuleText(String rule, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Text(
        rule,
        style: TextStyle(
          fontSize: 14,
          fontWeight:
              index == currentIndex ? FontWeight.bold : FontWeight.normal,
          color: index == currentIndex ? Colors.deepOrange : Colors.black,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/Y.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Lottie.asset(
                  'assets/animations/quiz.json',
                  height: 180,
                  repeat: true,
                ),

                ElevatedButton.icon(
                  onPressed: handleTtsToggle,
                  icon: Icon(isReading ? Icons.stop : Icons.volume_up),
                  label: Text(isReading ? "Stop Reading" : "Read Rules"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isReading ? Colors.red : Colors.deepOrange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                  ),
                ),
                const SizedBox(height: 10),

                // Scrollable Rules Box
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "📘 QUIZ RULES",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 8),
                          ...List.generate(
                            rules.length,
                            (i) => buildRuleText(rules[i], i),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Navigation Buttons
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                        ),
                        onPressed: () {
                          flutterTts.stop();
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
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 153, 216, 81),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                        ),
                        onPressed: () {
                          flutterTts.stop();
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
