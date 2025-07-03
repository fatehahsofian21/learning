import 'package:flutter/material.dart';
import 'function.dart';

class PartScreen extends StatelessWidget {
  const PartScreen({super.key});

  void _showPartDialog(BuildContext context, String partName) {
    if (partName == 'Pressure Sensor') {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            partName,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
            ),
          ),
          content: Image.asset(
            'assets/pressure.png', // Make sure this exists
            height: 200,
            fit: BoxFit.contain,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            partName,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Extrusion Machine Parts'),
        backgroundColor: Colors.indigo,
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Stack(
                children: [
                  Image.asset('assets/machine.png'),
                  Positioned(
                    left: 260,
                    top: 30,
                    width: 80,
                    height: 80,
                    child: GestureDetector(
                      onTap: () => _showPartDialog(context, 'Hopper'),
                      child: Container(color: Colors.transparent),
                    ),
                  ),
                  Positioned(
                    left: 90,
                    top: 80,
                    width: 180,
                    height: 100,
                    child: GestureDetector(
                      onTap: () => _showPartDialog(context, 'Barrel'),
                      child: Container(color: Colors.transparent),
                    ),
                  ),
                  Positioned(
                    left: 80,
                    top: 200,
                    width: 220,
                    height: 60,
                    child: GestureDetector(
                      onTap: () => _showPartDialog(context, 'Heaters'),
                      child: Container(color: Colors.transparent),
                    ),
                  ),
                  Positioned(
                    left: 60,
                    top: 270,
                    width: 250,
                    height: 60,
                    child: GestureDetector(
                      onTap: () => _showPartDialog(context, 'Air Cooling Fans'),
                      child: Container(color: Colors.transparent),
                    ),
                  ),
                  Positioned(
                    left: 30,
                    top: 30,
                    width: 100,
                    height: 60,
                    child: GestureDetector(
                      onTap: () => _showPartDialog(context, 'Pressure Sensor'),
                      child: Container(color: Colors.transparent),
                    ),
                  ),
                  Positioned(
                    left: 160,
                    top: 10,
                    width: 120,
                    height: 50,
                    child: GestureDetector(
                      onTap: () => _showPartDialog(context, 'Control Panel'),
                      child: Container(color: Colors.transparent),
                    ),
                  ),
                  Positioned(
                    left: 300,
                    top: 160,
                    width: 60,
                    height: 60,
                    child: GestureDetector(
                      onTap: () => _showPartDialog(context, 'Feed Casing'),
                      child: Container(color: Colors.transparent),
                    ),
                  ),
                  Positioned(
                    left: 360,
                    top: 200,
                    width: 80,
                    height: 80,
                    child: GestureDetector(
                      onTap: () => _showPartDialog(context, 'Gearbox'),
                      child: Container(color: Colors.transparent),
                    ),
                  ),
                  Positioned(
                    left: 450,
                    top: 210,
                    width: 80,
                    height: 80,
                    child: GestureDetector(
                      onTap: () => _showPartDialog(context, 'Belt Sheaves'),
                      child: Container(color: Colors.transparent),
                    ),
                  ),
                  Positioned(
                    left: 330,
                    top: 300,
                    width: 80,
                    height: 60,
                    child: GestureDetector(
                      onTap: () => _showPartDialog(context, 'Motor'),
                      child: Container(color: Colors.transparent),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Next Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FunctionScreen(),
                    ),
                  );
                },
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
