import 'package:flutter/material.dart';
import 'quizScreen.dart';

class PartScreen extends StatefulWidget {
  const PartScreen({super.key});

  @override
  State<PartScreen> createState() => _PartScreenState();
}

class _PartScreenState extends State<PartScreen> {
  String selectedPart = "Hopper";
  String selectedImage = "assets/hopper.png";
  String selectedDesc =
      "The hopper is where the process starts. It holds plastic pellets and drops them into the machine. From there, the pellets move into the barrel to be melted and shaped.";

  // Data for each part
  final List<Map<String, dynamic>> parts = [
    {
      "name": "Hopper",
      "desc":
          "The hopper is where the process starts. It holds plastic pellets and drops them into the machine. From there, the pellets move into the barrel to be melted and shaped.",
      "img": "assets/hopper.png",
      "dot": Offset(110, 20),
      "color": Colors.red
    },
    {
      "name": "Vacuum",
      "desc": "The vacuum removes air from the barrel.",
      "img": "assets/vacuum.png",
      "dot": Offset(220, 50),
      "color": Colors.orange
    },
    {
      "name": "Barrel Section",
      "desc": "The barrel section heats and melts the pellets.",
      "img": "assets/bs.png",
      "dot": Offset(170, 80),
      "color": Colors.purple
    },
    {
      "name": "Gear Box",
      "desc": "The gear box transmits power to the screw.",
      "img": "assets/gb.png",
      "dot": Offset(60, 120),
      "color": Colors.lightGreen
    },
    {
      "name": "Screen Changer",
      "desc": "The screen changer filters out contaminants.",
      "img": "assets/sc.png",
      "dot": Offset(250, 120),
      "color": Colors.green[900]
    },
    {
      "name": "Motor",
      "desc": "The motor drives the screw.",
      "img": "assets/motor.png",
      "dot": Offset(320, 140),
      "color": Colors.blue
    },
  ];

  void selectPart(int idx) {
    setState(() {
      selectedPart = parts[idx]["name"];
      selectedImage = parts[idx]["img"];
      selectedDesc = parts[idx]["desc"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Wallpaper background
            Positioned.fill(
              child: Image.asset(
                'assets/wall.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Logos
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24.0, vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/FRIT.png', height: 35),
                      Image.asset('assets/unisza.png', height: 35),
                      Image.asset('assets/POLY.png', height: 35),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                // Main box
                Expanded(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 8, right: 8),
                      child: Column(
                        children: [
                          // --- Box 1: Mesin image, dots, and instruction text ---
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.95),
                              borderRadius: BorderRadius.circular(18),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 8,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Kindly select each parts for details",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Stack(
                                  children: [
                                    Image.asset(
                                      'assets/mesen.png',
                                      width: MediaQuery.of(context).size.width *
                                          0.95,
                                      fit: BoxFit.contain,
                                    ),
                                    // Dots
                                    for (int i = 0; i < parts.length; i++)
                                      Positioned(
                                        left: parts[i]["dot"].dx,
                                        top: parts[i]["dot"].dy,
                                        child: GestureDetector(
                                          onTap: () => selectPart(i),
                                          child: buildDot(parts[i]["color"]),
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                          // --- Box 2: Selected part info and image ---
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.95),
                              borderRadius: BorderRadius.circular(18),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 8,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "PART EXTRUSION",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                const Text(
                                  "Precision Repairs, Guaranteed Quality",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black87,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Left: Part image and label
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        children: [
                                          Text(
                                            selectedPart.toUpperCase(),
                                            style: const TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Image.asset(
                                            selectedImage,
                                            height: 90,
                                            fit: BoxFit.contain,
                                          ),
                                        ],
                                      ),
                                    ),
                                    // Right: Description box
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        margin: const EdgeInsets.only(left: 12),
                                        padding: const EdgeInsets.all(8),
                                        color: Colors.yellow[100],
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              // Custom label for each part
                                              selectedPart == "Screen Changer"
                                                  ? "SCREEN CHANGER"
                                                  : selectedPart == "Vacuum"
                                                      ? "VACUUM SYSTEM"
                                                      : selectedPart ==
                                                              "Barrel Section"
                                                          ? "BARREL & SCREW"
                                                          : selectedPart ==
                                                                  "Feeder"
                                                              ? "FEEDER"
                                                              : selectedPart ==
                                                                          "Gear Box" ||
                                                                      selectedPart ==
                                                                          "Motor"
                                                                  ? "GEARBOX & MOTOR"
                                                                  : selectedPart,
                                              style: const TextStyle(
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                            Text(
                                              // Custom description for each part
                                              selectedPart == "Screen Changer"
                                                  ? "The screen changer filters out contaminants from the melted plastic before it is shaped. This ensures the final product is clean and free from unwanted particles."
                                                  : selectedPart == "Vacuum"
                                                      ? "The vacuum system removes air from the barrel, preventing bubbles and ensuring a smooth extrusion process."
                                                      : selectedPart ==
                                                              "Barrel Section"
                                                          ? "The barrel and screw work together to heat, melt, and mix the plastic pellets before extrusion."
                                                          : selectedPart ==
                                                                  "Feeder"
                                                              ? "The feeder supplies plastic pellets into the hopper, starting the extrusion process."
                                                              : selectedPart ==
                                                                          "Gear Box" ||
                                                                      selectedPart ==
                                                                          "Motor"
                                                                  ? "The gearbox transmits power to the screw, while the motor drives the entire extrusion process."
                                                                  : selectedDesc,
                                              style: const TextStyle(
                                                color: Colors.black87,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // www.frit.unisza.edu.my text
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0, left: 16.0, top: 8),
                  child: Text(
                    "www.frit.unisza.edu.my",
                    style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      letterSpacing: 1.1,
                    ),
                  ),
                ),
              ],
            ),
            // Next button
            Positioned(
              bottom: 15,
              right: 20,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QuizSplashScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 153, 216, 81),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 15, 71, 23),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget buildDot(Color? color) {
    return Container(
      width: 18,
      height: 18,
      decoration: BoxDecoration(
        color: color ?? Colors.grey,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black),
      ),
    );
  }
}
