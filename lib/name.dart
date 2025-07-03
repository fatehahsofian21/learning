import 'package:flutter/material.dart';
import 'part.dart'; // Your next screen

class NameScreen extends StatefulWidget {
  const NameScreen({super.key});

  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  final List<Map<String, String>> students = [
    {'name': 'AMIRUL HAKIM B. SA\'ARI', 'matrix': '74880'},
    {'name': 'BADRUL HISYAM BIN ISMAIL @ TALIB', 'matrix': '72433'},
    {'name': 'CHA NON A/L IREAM', 'matrix': '73550'},
    {'name': 'JOEY KONG YUAN JIA', 'matrix': '73533'},
    {'name': 'LILY SYUHADA BINTI MOHD ROSLAN', 'matrix': '74520'},
    {'name': 'MOHAMAD SYAFIQ IDHAM BIN ROSIDI', 'matrix': '73598'},
    {'name': 'MUHAMMAD FAKHRUL IHSAN BIN MOHD TERMIZI', 'matrix': '73269'},
    {'name': 'MUHAMMAD KHAIRIE B. MAZLI', 'matrix': '74847'},
    {'name': 'NASHRIN NADIRA BINTI NASIR', 'matrix': '74555'},
    {'name': 'NIK NURUL ASHIKIN BT BAHARUDIN', 'matrix': '74694'},
    {'name': 'NUR AIN AQEELA BINTI MOHD SAIPU', 'matrix': '73352'},
    {'name': 'NUR DAMIA IZZATI BT FAUZI', 'matrix': '74683'},
    {'name': 'NUR FARAH NASUHA BINTI MOHD HAMRI', 'matrix': '71960'},
    {'name': 'NUR QISTINA ELIYANA BINTI RAMLI', 'matrix': '72235'},
    {'name': 'NUR SAQIRAH BINTI ADAM', 'matrix': '72226'},
    {'name': 'NUR USWATUL HUSNA BT ABDULLAH', 'matrix': '74860'},
    {'name': 'NURASSYAZWANI BINTI AZAHAR', 'matrix': '74753'},
    {'name': 'NURUL ASMAHANI BINTI MOHD DAUD', 'matrix': '72353'},
    {'name': 'ROSMANTASHA BINTI FAUZI', 'matrix': '74709'},
    {'name': 'SARAH NURALYA SYAMIMI BINTI ABDUL HADI', 'matrix': '72597'},
    {'name': 'SITI NUR AISYAH BINTI TENGAH', 'matrix': '72345'},
  ];

  String? selectedStudent;
  String? selectedMatrix;

  String getFirstName(String fullName) => fullName.split(' ').first;

  void _resetSelection() {
    setState(() {
      selectedStudent = null;
      selectedMatrix = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset('assets/unisza.png', height: 50),
              const SizedBox(height: 30),

              const Center(
                child: Text(
                  'PolyLearn',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Show list if not selected
              if (selectedStudent == null)
                const Text(
                  'Please select your name:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),

              const SizedBox(height: 10),

              if (selectedStudent == null)
                Expanded(
                  child: ListView.builder(
                    itemCount: students.length,
                    itemBuilder: (context, index) {
                      final student = students[index];
                      return ListTile(
                        title: Text(
                          student['name']!,
                          style: const TextStyle(fontSize: 16),
                        ),
                        subtitle: Text("Matrix: ${student['matrix']}"),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () {
                          setState(() {
                            selectedStudent = student['name'];
                            selectedMatrix = student['matrix'];
                          });
                        },
                      );
                    },
                  ),
                ),

              if (selectedStudent != null)
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '🎉 Welcome, ${getFirstName(selectedStudent!)}!',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'We’re glad you’re here!',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Back button
                      TextButton.icon(
                        onPressed: _resetSelection,
                        icon: const Icon(Icons.arrow_back, color: Colors.indigo),
                        label: const Text(
                          'Back',
                          style: TextStyle(
                            color: Colors.indigo,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              if (selectedStudent != null)
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PartScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Continue',
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
