import 'dart:async';
import 'package:flutter/material.dart';

class Quiz1Page extends StatefulWidget {
  const Quiz1Page({super.key});

  @override
  State<Quiz1Page> createState() => _Quiz1PageState();
}

class _Quiz1PageState extends State<Quiz1Page> {
  final List<Map<String, dynamic>> questions = [
    {
      "question": "What is the primary purpose of the extrusion process?",
      "options": [
        "To mold plastics into 3D parts",
        "To shape plastic materials into continuous profiles",
        "To cut plastics into small pieces",
        "To dry plastic resins"
      ],
      "answerIndex": 1
    },
    {
      "question": "Which part of the extruder conveys the polymer pellets forward?",
      "options": ["Hopper", "Barrel", "Die", "Screw"],
      "answerIndex": 3
    },
    {
      "question": "The feed section of the extruder screw is responsible for:",
      "options": [
        "Compressing the material",
        "Melting the polymer",
        "Feeding solid pellets into the extruder",
        "Shaping the final product"
      ],
      "answerIndex": 2
    },
    {
      "question": "What is the function of the die in extrusion molding?",
      "options": ["Melts the polymer", "Cuts the product", "Gives final shape", "Mixes additives"],
      "answerIndex": 2
    },
    {
      "question": "Which material is commonly used for pipes and tubes?",
      "options": ["Polystyrene", "Nylon", "PVC", "Teflon"],
      "answerIndex": 2
    },
    {
      "question": "Which zone is responsible for melting the plastic?",
      "options": ["Feed zone", "Metering zone", "Compression zone", "Exit zone"],
      "answerIndex": 2
    },
    {
      "question": "What is the typical shape of an extruded product?",
      "options": ["Irregular", "3D", "Continuous profile", "Thin sheet"],
      "answerIndex": 2
    },
    {
      "question": "What causes surging during extrusion?",
      "options": ["Die overheating", "Overfeeding", "Uneven rotation", "Inconsistent feed/temp"],
      "answerIndex": 3
    },
    {
      "question": "Which is NOT a typical extruded product?",
      "options": ["Film", "Wire coating", "Bottle", "Pipe"],
      "answerIndex": 2
    },
    {
      "question": "Which screw offers better mixing?",
      "options": ["Single flight", "Twin screw", "Solid core", "Hollow screw"],
      "answerIndex": 1
    },
    {
      "question": "Function of heater bands?",
      "options": ["Cool material", "Lubricate die", "Heat barrel", "Speed screw"],
      "answerIndex": 2
    },
    {
      "question": "Melt Flow Index measures?",
      "options": ["Screw speed", "Polymer color", "Flowability", "Cooling rate"],
      "answerIndex": 2
    },
    {
      "question": "Cooling method for extruded profiles?",
      "options": ["Radiation", "Air blast", "Water bath", "Vacuum pump"],
      "answerIndex": 2
    },
    {
      "question": "If the die is partially blocked?",
      "options": [
        "Stronger product",
        "Uniform thickness",
        "Uneven shape",
        "Faster rotation"
      ],
      "answerIndex": 2
    },
    {
      "question": "What does 'draw down' mean?",
      "options": [
        "Heating polymer",
        "Stretching extrudate",
        "Cooling product",
        "Cleaning die"
      ],
      "answerIndex": 1
    },
    {
      "question": "A common defect in extrusion?",
      "options": ["Flash", "Sink mark", "Die lines", "Knit lines"],
      "answerIndex": 2
    },
    {
      "question": "Material used in fiber extrusion?",
      "options": ["Polycarbonate", "Polyethylene", "Nylon", "PVC"],
      "answerIndex": 2
    },
    {
      "question": "Why is back pressure needed?",
      "options": [
        "Lubricate barrel",
        "Fast exit",
        "Improve mixing/melting",
        "Reduce temperature"
      ],
      "answerIndex": 2
    },
    {
      "question": "'Screw L/D ratio' means?",
      "options": ["Load/diameter", "Length/diameter", "Level/depth", "Light/dark"],
      "answerIndex": 1
    },
    {
      "question": "Larger L/D ratio results in?",
      "options": [
        "Lower output",
        "Faster cooling",
        "Better mixing",
        "Slower processing"
      ],
      "answerIndex": 2
    }
  ];

  int currentQuestion = 0;
  int selectedIndex = -1;
  bool isAnswered = false;
  int score = 0;
  int timeLeft = 60;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (timeLeft > 0) {
        setState(() => timeLeft--);
      } else {
        nextQuestion();
      }
    });
  }

  void checkAnswer(int index) {
    if (isAnswered) return;
    setState(() {
      selectedIndex = index;
      isAnswered = true;
      if (index == questions[currentQuestion]['answerIndex']) {
        score++;
      }
    });
  }

  void nextQuestion() {
    timer?.cancel();
    if (currentQuestion < questions.length - 1) {
      setState(() {
        currentQuestion++;
        selectedIndex = -1;
        isAnswered = false;
        timeLeft = 60;
      });
      startTimer();
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: Colors.white,
          title: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.indigo.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Text(
                '🎉 Quiz Completed!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.indigo,
                ),
              ),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 12),
              Text(
                'You scored',
                style: TextStyle(fontSize: 16, color: Colors.grey[800]),
              ),
              Text(
                '$score / ${questions.length}',
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Great effort! You’ve completed the quiz successfully.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close dialog
                Navigator.pop(context); // Go back to previous screen
              },
              child: const Text('Close'),
            ),
          ],
        ),
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final q = questions[currentQuestion];
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Y.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              children: [
                Image.asset('assets/q.png', height: 60),
                const SizedBox(height: 12),
                Text(
                  "QUESTION ${currentQuestion + 1}/${questions.length}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.timer, color: Colors.black87),
                    const SizedBox(width: 6),
                    Text(
                      "$timeLeft s",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  q['question'],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                ...List.generate(q['options'].length, (index) {
                  final isSelected = selectedIndex == index;
                  final isCorrect = index == q['answerIndex'];
                  Color bgColor = Colors.white;

                  if (isAnswered) {
                    if (isSelected && isCorrect) bgColor = Colors.green;
                    else if (isSelected && !isCorrect) bgColor = Colors.red;
                    else if (!isSelected && isCorrect) bgColor = Colors.green;
                  }

                  return GestureDetector(
                    onTap: () => checkAnswer(index),
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      padding: const EdgeInsets.symmetric(
                          vertical: 14, horizontal: 16),
                      decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.black),
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Text(
                              String.fromCharCode(65 + index),
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              q['options'][index],
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
                const Spacer(),
                if (isAnswered)
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton.icon(
                      onPressed: nextQuestion,
                      icon: const Icon(Icons.arrow_forward),
                      label: const Text('Next'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
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
