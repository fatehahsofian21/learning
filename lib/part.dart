import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'quizScreen.dart';

class PartScreen extends StatefulWidget {
  const PartScreen({super.key});

  @override
  State<PartScreen> createState() => _PartScreenState();
}

class _PartScreenState extends State<PartScreen> {
  final FlutterTts flutterTts = FlutterTts();

  String selectedPart = "Feeder";
  String selectedImage = "assets/feeder.png";
  String selectedDesc =
      "The feeder supplies plastic pellets into the hopper, starting the extrusion process.";
  String selectedFunction =
      "Controls the flow of raw material into the machine.";

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
  ];

  @override
  void initState() {
    super.initState();
    flutterTts.setSpeechRate(0.5); // normal speed
    flutterTts.setPitch(1.0);
  }

  Future<void> speakPart(String name, String desc, String function) async {
    await flutterTts.stop();
    await flutterTts.speak(name);
    await flutterTts.awaitSpeakCompletion(true);
    await flutterTts.speak(desc);
    await flutterTts.awaitSpeakCompletion(true);
    await flutterTts.speak("Function: $function");
  }

  void selectPart(int idx) {
    setState(() {
      selectedPart = parts[idx]["name"];
      selectedImage = parts[idx]["img"];
      selectedDesc = parts[idx]["desc"];
      selectedFunction = parts[idx]["function"];
    });
    speakPart(selectedPart, selectedDesc, selectedFunction);
  }

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/wall1.jpg',
                fit: BoxFit.fill,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 80),
                Expanded(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFF9C4).withOpacity(0.80),
                              borderRadius: BorderRadius.circular(18),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 8,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Kindly tap on each parts for details",
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
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFFBE9E7).withOpacity(0.80),
                              borderRadius: BorderRadius.circular(18),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 8,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.all(16),
                            child: Column(
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
                                Text(
                                  selectedPart.toUpperCase(),
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      selectedImage,
                                      height: 80,
                                      fit: BoxFit.contain,
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Container(
                                        height: 140,
                                        padding: const EdgeInsets.all(8),
                                        color: Colors.yellow[100],
                                        child: SingleChildScrollView(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                selectedDesc,
                                                style: const TextStyle(
                                                  color: Colors.black87,
                                                  fontSize: 13,
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              RichText(
                                                text: TextSpan(
                                                  style: const TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 13,
                                                  ),
                                                  children: [
                                                    const TextSpan(
                                                      text: "Function: ",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: selectedFunction,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 153, 216, 81),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                ),
                                onPressed: () {
                                  flutterTts
                                      .stop(); // Stop TTS before navigating
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const QuizSplashScreen(),
                                    ),
                                  );
                                },
                                icon: const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 18,
                                ),
                                label: const Text(
                                  'NEXT',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static Widget buildDot(Color? color) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        color: color ?? Colors.grey,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black),
      ),
    );
  }
}
