import 'package:flutter/material.dart';
import 'quizScreen.dart';

class PartScreen extends StatefulWidget {
  const PartScreen({super.key});

  @override
  State<PartScreen> createState() => _PartScreenState();
}

class _PartScreenState extends State<PartScreen> {
  String selectedPart = "Feeder";
  String selectedImage = "assets/feeder.png";
  String selectedDesc =
      "The feeder supplies plastic pellets into the hopper, starting the extrusion process.";

  // Data for each part (now 8 dots, adjust positions as needed)
  final List<Map<String, dynamic>> parts = [
    {
      "name": "Feeder",
      "desc":
          "The feeder supplies plastic pellets into the hopper, starting the extrusion process.",
      "function": "Controls the flow of raw material into the machine.",
      "img": "assets/feeder.png",
      "dot": Offset(170, 30),
      "color": Colors.orange
    },
    {
      "name": "Motor",
      "desc": "The motor drives the screw.",
      "function": "Provides the mechanical force needed for extrusion.",
      "img": "assets/motor.png",
      "dot": Offset(290, 100),
      "color": Colors.purple
    },
    {
      "name": "Gear Box",
      "desc": "The gear box transmits power to the screw.",
      "function":
          "Ensures efficient power delivery and speed control for extrusion.",
      "img": "assets/gb.png",
      "dot": Offset(200, 100),
      "color": Colors.lightGreen
    },
    {
      "name": "Vacuum",
      "desc": "The vacuum removes air from the barrel.",
      "function": "Prevents bubbles and ensures a smooth extrusion process.",
      "img": "assets/vacuum.png",
      "dot": Offset(40, 80),
      "color": Colors.green[900]
    },
    {
      "name": "Barrel & Screw",
      "desc":
          "The barrel and screw work together to heat, melt, and mix the plastic pellets before extrusion.",
      "function":
          "Provides uniform melting and mixing for high-quality output.",
      "img": "assets/bs.png",
      "dot": Offset(60, 110),
      "color": Colors.blue
    },
    {
      "name": "Screen Changer",
      "desc":
          "The screen changer filters out contaminants from the melted plastic before it is shaped.",
      "function":
          "Maintains product quality by removing debris and impurities during extrusion.",
      "img": "assets/sc.png",
      "dot": Offset(8, 85),
      "color": Colors.red
    },
    // Add two more parts if needed for 8 dots
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
                      Image.asset('assets/FRIT.png', height: 45),
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
                              color: const Color(0xFFFFF9C4).withOpacity(
                                  0.80), // soft yellow, less transparent
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
                              color: const Color(0xFFFBE9E7).withOpacity(
                                  0.80), // nude/peach, less transparent
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
                                    // Right: Description box (make longer)
                                    Expanded(
                                      flex:
                                          4, // <-- Increase flex to make box longer
                                      child: Container(
                                        margin: const EdgeInsets.only(left: 12),
                                        padding: const EdgeInsets.all(8),
                                        color: Colors.yellow[100],
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              selectedPart == "Screen Changer"
                                                  ? "SCREEN CHANGER"
                                                  : selectedPart == "Vacuum"
                                                      ? "VACUUM SYSTEM"
                                                      : selectedPart ==
                                                              "Barrel & Screw"
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
                                              selectedPart == "Screen Changer"
                                                  ? "The screen changer filters out contaminants from the melted plastic before it is shaped. This ensures the final product is clean and free from unwanted particles.\n\nFunction: Maintains product quality by removing debris and impurities during extrusion."
                                                  : selectedPart == "Vacuum"
                                                      ? "The vacuum system removes air from the barrel, preventing bubbles and ensuring a smooth extrusion process.\n\nFunction: Improves the consistency and strength of the extruded product."
                                                      : selectedPart ==
                                                              "Barrel & Screw"
                                                          ? "The barrel and screw work together to heat, melt, and mix the plastic pellets before extrusion.\n\nFunction: Provides uniform melting and mixing for high-quality output."
                                                          : selectedPart ==
                                                                  "Feeder"
                                                              ? "The feeder supplies plastic pellets into the hopper, starting the extrusion process.\n\nFunction: Controls the flow of raw material into the machine."
                                                              : selectedPart ==
                                                                          "Gear Box" ||
                                                                      selectedPart ==
                                                                          "Motor"
                                                                  ? "The gearbox transmits power to the screw, while the motor drives the entire extrusion process.\n\nFunction: Ensures efficient power delivery and speed control for extrusion."
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
                      color: Color.fromARGB(255, 21, 13, 1),
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

  // Make dots smaller
  static Widget buildDot(Color? color) {
    return Container(
      width: 12, // smaller size
      height: 12,
      decoration: BoxDecoration(
        color: color ?? Colors.grey,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black),
      ),
    );
  }
}
