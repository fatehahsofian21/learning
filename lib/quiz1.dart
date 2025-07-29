import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Quiz1Page extends StatefulWidget {
  const Quiz1Page({super.key});

  @override
  State<Quiz1Page> createState() => _Quiz1PageState();
}

class _Quiz1PageState extends State<Quiz1Page> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final AudioPlayer _celebrationPlayer = AudioPlayer();

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
      "options": [
        "Melts the polymer",
        "Cuts the product",
        "Gives the final shape to the polymer",
        "Mixes the additives"
      ],
      "answerIndex": 2
    },
    {
      "question": "In plastic extrusion, which material is commonly used for pipes and tubes?",
      "options": ["Polystyrene", "Nylon", "PVC", "Teflon"],
      "answerIndex": 2
    },
    {
      "question": "Which zone of the screw is responsible for melting the plastic?",
      "options": ["Feed zone", "Metering zone", "Compression zone", "Exit zone"],
      "answerIndex": 2
    },
    {
      "question": "What is the typical shape of an extruded product?",
      "options": ["Irregular", "Complex 3D", "Continuous profile", "Thin sheet"],
      "answerIndex": 2
    },
    {
      "question": "What causes surging during extrusion?",
      "options": [
        "Die overheating",
        "Hopper overfeeding",
        "Uneven screw rotation",
        "Inconsistent feed rate or temperature"
      ],
      "answerIndex": 3
    },
    {
      "question": "Which of the following is NOT a typical extruded product?",
      "options": ["Film", "Wire coating", "Bottle", "Pipe"],
      "answerIndex": 2
    },
    {
      "question": "Which type of screw offers better mixing in extrusion?",
      "options": ["Single flight", "Twin screw", "Solid core", "Hollow screw"],
      "answerIndex": 1
    },
    {
      "question": "What is the function of the heater bands in extrusion machines?",
      "options": [
        "Cool the material",
        "Lubricate the die",
        "Heat the barrel zones",
        "Speed up the screw"
      ],
      "answerIndex": 2
    },
    {
      "question": "What is the melt flow index (MFI) a measure of?",
      "options": [
        "Screw speed",
        "Polymer color",
        "Flowability of melted polymer",
        "Cooling rate"
      ],
      "answerIndex": 2
    },
    {
      "question": "Which cooling method is commonly used for extruded plastic profiles?",
      "options": ["Radiation", "Air blast", "Water bath", "Vacuum pump"],
      "answerIndex": 2
    },
    {
      "question": "What happens if the die is partially blocked?",
      "options": [
        "Product becomes stronger",
        "Product thickness becomes uniform",
        "Product develops uneven shape",
        "The screw rotates faster"
      ],
      "answerIndex": 2
    },
    {
      "question": "What does the term 'draw down' refer to in extrusion?",
      "options": [
        "Heating the polymer",
        "Stretching the extrudate",
        "Cooling the product",
        "Cleaning the die"
      ],
      "answerIndex": 1
    },
    {
      "question": "What is a common defect in extrusion molding?",
      "options": ["Flash", "Sink mark", "Die lines", "Knit lines"],
      "answerIndex": 2
    },
    {
      "question": "Which material is frequently used in fiber extrusion?",
      "options": ["Polycarbonate", "Polyethylene", "Nylon", "PVC"],
      "answerIndex": 2
    },
    {
      "question": "Why is back pressure needed in an extruder?",
      "options": [
        "To lubricate the barrel",
        "To ensure material exits fast",
        "To improve mixing and melting",
        "To reduce temperature"
      ],
      "answerIndex": 2
    },
    {
      "question": "What does 'screw L/D ratio' refer to?",
      "options": [
        "Load to diameter",
        "Length to diameter",
        "Level to depth",
        "Light to dark"
      ],
      "answerIndex": 1
    },
    {
      "question": "A larger L/D ratio in an extruder results in:",
      "options": [
        "Lower output",
        "Faster cooling",
        "Better mixing and melting",
        "Slower processing"
      ],
      "answerIndex": 2
    },
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
    playBackgroundMusic();
  }

  void playBackgroundMusic() async {
    await _audioPlayer.setReleaseMode(ReleaseMode.loop);
    await _audioPlayer.play(AssetSource('sounds/audio.mp3'), volume: 0.4);
  }

  void playCelebrationSound() async {
    await _celebrationPlayer.play(AssetSource('sounds/yeay.mp3'));
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (timeLeft > 0) {
        setState(() => timeLeft--);
      } else {
        if (!isAnswered) {
          setState(() {
            isAnswered = true;
            selectedIndex = -1;
          });
        }
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
      _audioPlayer.stop();
      playCelebrationSound();
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
              Text('You scored', style: TextStyle(fontSize: 16, color: Colors.grey[800])),
              Text('$score / ${questions.length}',
                  style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.green)),
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
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
          ],
        ),
      );
    }
  }

  void confirmExit() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Exit Quiz"),
        content: const Text("Are you sure you want to exit the quiz?"),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
          TextButton(
            onPressed: () {
              _audioPlayer.stop();
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text("Yes, Exit"),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    _audioPlayer.dispose();
    _celebrationPlayer.dispose();
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
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: const Icon(Icons.close, color: Colors.red),
                        onPressed: confirmExit,
                      ),
                    ),
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
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    ...List.generate(q['options'].length, (index) {
                      final isSelected = selectedIndex == index;
                      final isCorrect = index == q['answerIndex'];
                      Color bgColor = Colors.white;

                      if (isAnswered) {
                        if (selectedIndex == -1 && isCorrect) {
                          bgColor = Colors.red; // show only correct answer in red if timeout
                        } else if (isSelected && isCorrect) {
                          bgColor = Colors.green;
                        } else if (isSelected && !isCorrect) {
                          bgColor = Colors.red;
                        } else if (!isSelected && isCorrect) {
                          bgColor = Colors.green;
                        }
                      }

                      return GestureDetector(
                        onTap: () => checkAnswer(index),
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                          decoration: BoxDecoration(
                            color: bgColor,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.black),
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Text(String.fromCharCode(65 + index),
                                    style: const TextStyle(color: Colors.black)),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(q['options'][index],
                                    style: const TextStyle(fontSize: 16)),
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
                            padding:
                                const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
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
    );
  }
}
