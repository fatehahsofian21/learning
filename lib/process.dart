import 'package:flutter/material.dart';
import 'advantage.dart'; // Make sure this file exists

class ProcessScreen extends StatefulWidget {
  const ProcessScreen({super.key});

  @override
  State<ProcessScreen> createState() => _ProcessScreenState();
}

class _ProcessScreenState extends State<ProcessScreen> {
  final List<Map<String, String>> steps = const [
    {
      'step': 'Preparation',
      'description':
          'Ensure the raw material (e.g., plastic pellets) is ready and free from moisture.',
    },
    {
      'step': 'Feeding',
      'description':
          'Pour the pellets into the hopper. The hopper feeds material into the barrel.',
    },
    {
      'step': 'Heating',
      'description':
          'Turn on the heaters to melt the plastic as it moves through the heated barrel.',
    },
    {
      'step': 'Extrusion',
      'description':
          'The rotating screw pushes the melted plastic through the die to form the desired shape.',
    },
    {
      'step': 'Cooling',
      'description':
          'The extruded shape is cooled using fans or water to harden it.',
    },
    {
      'step': 'Cutting',
      'description':
          'Cut the cooled product into lengths or collect it in rolls depending on the final use.',
    },
    {
      'step': 'Shutdown',
      'description':
          'Turn off the machine, clean the barrel and screw, and perform maintenance if needed.',
    },
  ];

  final ScrollController _scrollController = ScrollController();
  bool _showNextButton = false;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        setState(() {
          _showNextButton = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F5FC),
      appBar: AppBar(
        title: const Text('Extrusion Process Steps'),
        backgroundColor: Colors.indigo,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              child: Column(
                children: List.generate(steps.length, (index) {
                  final step = steps[index];
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 2,
                            height: index == 0 ? 12 : 24,
                            color: Colors.indigo,
                          ),
                          CircleAvatar(
                            radius: 14,
                            backgroundColor: Colors.indigo,
                            child: Text(
                              '${index + 1}',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          Container(
                            width: 2,
                            height: index == steps.length - 1 ? 12 : 40,
                            color: Colors.indigo,
                          ),
                        ],
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 24),
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
                                step['step']!,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.indigo,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                step['description']!,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ),
          if (_showNextButton)
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AdvantageScreen()),
                    );
                  },
                  child: const Text(
                    'Next',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
