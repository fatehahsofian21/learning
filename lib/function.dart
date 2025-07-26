import 'package:flutter/material.dart';

class FunctionScreen extends StatelessWidget {
  const FunctionScreen({super.key});

  void _showFunctionDialog(BuildContext context, String functionText) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Function',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.indigo,
          ),
        ),
        content: Text(
          functionText,
          style: const TextStyle(fontSize: 18),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Functions'),
        backgroundColor: Colors.indigo,
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Stack(
                children: [
                  Image.asset('assets/machine.png'),

                  // Tap zones for each part with function text
                  Positioned(
                    left: 260,
                    top: 30,
                    width: 80,
                    height: 80,
                    child: GestureDetector(
                      onTap: () => _showFunctionDialog(context,
                          'Feeds raw plastic pellets into the barrel.'),
                      child: Container(color: Colors.transparent),
                    ),
                  ),
                  Positioned(
                    left: 90,
                    top: 80,
                    width: 180,
                    height: 100,
                    child: GestureDetector(
                      onTap: () => _showFunctionDialog(context,
                          'Houses the screw and provides the path for melting and mixing.'),
                      child: Container(color: Colors.transparent),
                    ),
                  ),
                  Positioned(
                    left: 80,
                    top: 200,
                    width: 220,
                    height: 60,
                    child: GestureDetector(
                      onTap: () => _showFunctionDialog(context,
                          'Heats the plastic pellets to their melting point.'),
                      child: Container(color: Colors.transparent),
                    ),
                  ),
                  Positioned(
                    left: 60,
                    top: 270,
                    width: 250,
                    height: 60,
                    child: GestureDetector(
                      onTap: () => _showFunctionDialog(context,
                          'Cools the melted plastic after it exits the die.'),
                      child: Container(color: Colors.transparent),
                    ),
                  ),
                  Positioned(
                    left: 30,
                    top: 30,
                    width: 100,
                    height: 60,
                    child: GestureDetector(
                      onTap: () => _showFunctionDialog(
                          context, 'Monitors and regulates internal pressure.'),
                      child: Container(color: Colors.transparent),
                    ),
                  ),
                  Positioned(
                    left: 160,
                    top: 10,
                    width: 120,
                    height: 50,
                    child: GestureDetector(
                      onTap: () => _showFunctionDialog(context,
                          'Controls the temperature, pressure, and screw speed.'),
                      child: Container(color: Colors.transparent),
                    ),
                  ),
                  Positioned(
                    left: 300,
                    top: 160,
                    width: 60,
                    height: 60,
                    child: GestureDetector(
                      onTap: () => _showFunctionDialog(context,
                          'Feeds the melted plastic from hopper to the screw.'),
                      child: Container(color: Colors.transparent),
                    ),
                  ),
                  Positioned(
                    left: 360,
                    top: 200,
                    width: 80,
                    height: 80,
                    child: GestureDetector(
                      onTap: () => _showFunctionDialog(context,
                          'Transfers power from the motor to the screw.'),
                      child: Container(color: Colors.transparent),
                    ),
                  ),
                  Positioned(
                    left: 450,
                    top: 210,
                    width: 80,
                    height: 80,
                    child: GestureDetector(
                      onTap: () => _showFunctionDialog(context,
                          'Connects the gearbox to the motor via belts.'),
                      child: Container(color: Colors.transparent),
                    ),
                  ),
                  Positioned(
                    left: 330,
                    top: 300,
                    width: 80,
                    height: 60,
                    child: GestureDetector(
                      onTap: () => _showFunctionDialog(context,
                          'Drives the screw to rotate and mix/move materials.'),
                      child: Container(color: Colors.transparent),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
