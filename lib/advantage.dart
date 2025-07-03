import 'package:flutter/material.dart';
import 'quizScreen.dart'; // ✅ Add this import

class AdvantageScreen extends StatefulWidget {
  const AdvantageScreen({super.key});

  @override
  State<AdvantageScreen> createState() => _AdvantageScreenState();
}

class _AdvantageScreenState extends State<AdvantageScreen> {
  final List<Map<String, String>> advantages = const [
    {
      'title': 'High Efficiency',
      'description':
          'Extrusion machines can continuously produce materials with minimal interruptions, increasing productivity.',
    },
    {
      'title': 'Cost-Effective',
      'description':
          'The extrusion process uses less energy and material waste, reducing overall manufacturing costs.',
    },
    {
      'title': 'Versatile Output',
      'description':
          'Can produce a variety of shapes, sizes, and profiles to meet different product requirements.',
    },
    {
      'title': 'Consistent Quality',
      'description':
          'Maintains uniformity in output with precise control over temperature, pressure, and material feed.',
    },
    {
      'title': 'Recyclable Material Usage',
      'description':
          'Supports the use of recycled plastics, making it environmentally friendly.',
    },
    {
      'title': 'Automation Friendly',
      'description':
          'Can be integrated with sensors and controllers for smart manufacturing.',
    },
  ];

  final ScrollController _scrollController = ScrollController();
  bool _isAtBottom = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_checkScrollPosition);
  }

  void _checkScrollPosition() {
    if (_scrollController.offset >= _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() => _isAtBottom = true);
    } else {
      setState(() => _isAtBottom = false);
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_checkScrollPosition);
    _scrollController.dispose();
    super.dispose();
  }

  void _goToNextScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const QuizSplashScreen()), // ✅ navigate to quiz screen
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F5FC),
      appBar: AppBar(
        title: const Text('Advantages of Extrusion Machine'),
        backgroundColor: Colors.indigo,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(16),
              itemCount: advantages.length,
              itemBuilder: (context, index) {
                final advantage = advantages[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        advantage['title']!,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        advantage['description']!,
                        style:
                            const TextStyle(fontSize: 16, color: Colors.black87),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          if (_isAtBottom)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _goToNextScreen(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Next',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
