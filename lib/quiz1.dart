import 'package:flutter/material.dart';

class Quiz1Page extends StatefulWidget {
  const Quiz1Page({super.key});

  @override
  State<Quiz1Page> createState() => _Quiz1PageState();
}

class _Quiz1PageState extends State<Quiz1Page> {
  int selectedIndex = -1;
  bool isAnswered = false;
  int correctAnswerIndex = 1; // Index of correct answer

  List<String> options = [
    'Injection Molding',
    'Extrusion',
    '3D Printing',
    'Blow Molding',
  ];

  void checkAnswer(int index) {
    if (isAnswered) return;

    setState(() {
      selectedIndex = index;
      isAnswered = true;
    });

    final isCorrect = index == correctAnswerIndex;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(isCorrect ? '✅ Correct!' : '❌ Wrong Answer'),
        backgroundColor: isCorrect ? Colors.green : Colors.red,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz 1'),
        backgroundColor: Colors.indigo,
      ),
      backgroundColor: const Color(0xFFF2F5FC),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Q1: Which process pushes melted plastic through a die to form shapes?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 24),
            ...List.generate(options.length, (index) {
              final isSelected = selectedIndex == index;
              final isCorrect = index == correctAnswerIndex;

              Color tileColor() {
                if (!isAnswered) return Colors.white;
                if (isSelected && isCorrect) return Colors.green.shade100;
                if (isSelected && !isCorrect) return Colors.red.shade100;
                return Colors.white;
              }

              return GestureDetector(
                onTap: () => checkAnswer(index),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: tileColor(),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.indigo,
                      width: 1.5,
                    ),
                  ),
                  child: Text(
                    options[index],
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              );
            }),
            const SizedBox(height: 30),
            if (isAnswered)
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Navigate to next quiz question/page
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Next',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
