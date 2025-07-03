import 'package:flutter/material.dart';
import 'part.dart'; // Make sure part.dart exists or update the path

class NameScreen extends StatefulWidget {
  const NameScreen({super.key});

  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  final List<String> names = ['Ali', 'Fatimah', 'John', 'Sarah'];
  final List<String> matrixNumbers = ['S123456', 'S789012', 'S345678'];

  String? selectedName;
  String? selectedMatrix;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Top Row: Logos
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/unisza.png', // Make sure the path is correct
                    height: 50,
                  ),
                  const SizedBox(width: 50), // Right placeholder
                ],
              ),
              const SizedBox(height: 40),

              // Center Title
              const Center(
                child: Text(
                  'PolyLearn',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                    height: 1.3,
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // Name Dropdown
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                value: selectedName,
                items: names.map((name) {
                  return DropdownMenuItem<String>(
                    value: name,
                    child: Text(name),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedName = value;
                  });
                },
              ),
              const SizedBox(height: 20),

              // Matrix Dropdown
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Matrix',
                  border: OutlineInputBorder(),
                ),
                value: selectedMatrix,
                items: matrixNumbers.map((matrix) {
                  return DropdownMenuItem<String>(
                    value: matrix,
                    child: Text(matrix),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedMatrix = value;
                  });
                },
              ),
              const SizedBox(height: 30),

              // Next Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo[700],
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  if (selectedName != null && selectedMatrix != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PartScreen()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please select your name and matrix number.'),
                      ),
                    );
                  }
                },
                child: const Text(
                  'Next',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
