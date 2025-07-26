import 'package:flutter/material.dart';
import 'part.dart';

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

  void _resetSelection() {
    setState(() {
      selectedStudent = null;
      selectedMatrix = null;
    });
  }

  String getSecondName(String fullName) {
    final parts = fullName.trim().split(' ');
    if (parts.length >= 2) {
      return parts[1].toUpperCase();
    } else {
      return parts.first.toUpperCase();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Change background to use wall.png as wallpaper
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/wall.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/unisza.png', height: 50),
                  const SizedBox(height: 30),
                  if (selectedStudent == null)
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Please select your name:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  const SizedBox(height: 10),
                  if (selectedStudent == null)
                    Expanded(
                      child: ListView.builder(
                        itemCount: students.length,
                        itemBuilder: (context, index) {
                          final student = students[index];
                          return Card(
                            child: ListTile(
                              title: Text(student['name']!),
                              subtitle: Text("Matrix: ${student['matrix']}"),
                              trailing: const Icon(Icons.chevron_right),
                              onTap: () {
                                setState(() {
                                  selectedStudent = student['name'];
                                  selectedMatrix = student['matrix'];
                                });
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  if (selectedStudent != null)
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(
                              255, 236, 212, 74), // yellow box
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 8,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 32, horizontal: 18),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: const TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(
                                      255, 108, 69, 6), // brown font
                                ),
                                children: [
                                  const TextSpan(
                                    text: '🎉 Welcome, ',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 108, 69, 6)),
                                  ),
                                  TextSpan(
                                    text: '${getSecondName(selectedStudent!)}!',
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 108, 69, 6),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              'We’re glad you’re here!',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 108, 69, 6),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 130,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          const Color(0xFF26A69A), // Teal
                                      foregroundColor: Colors.white,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 14),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const PartScreen()),
                                      );
                                    },
                                    child: const Text(
                                      'ENTER',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                SizedBox(
                                  width: 130,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.redAccent,
                                      foregroundColor: Colors.white,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 14),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    onPressed: _resetSelection,
                                    child: const Text(
                                      'BACK',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
