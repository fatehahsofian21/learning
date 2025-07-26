import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'quiz1.dart';

class QuizSplashScreen extends StatelessWidget {
  const QuizSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/Y.jpg"), // Background wallpaper
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(height: 30),

                  // Centered Lottie animation (replaces Quizzy text and READY image)
                  Lottie.asset(
                    'assets/animations/quiz.json',
                    height: 200,
                    repeat: true,
                  ),

                  const SizedBox(height: 12),

                  // Rules box
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "📘 PERATURAN MENJAWAB SOALAN",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                            "✅ Baca arahan dengan teliti sebelum menjawab setiap soalan."),
                        Text(
                            "✍️ Gunakan pen biru atau hitam sahaja (jika bertulis tangan)."),
                        Text(
                            "⏰ Jawab dalam masa yang ditetapkan. Lewat tidak akan diterima."),
                        Text(
                            "🚫 Dilarang menggunakan telefon bimbit atau sebarang alat bantuan luar."),
                        Text(
                            "🙅 Tidak dibenarkan bertanya atau berbincang dengan rakan semasa menjawab."),
                        Text("📝 Semak jawapan anda sebelum menghantar."),
                        Text(
                            "⚠️ Plagiarisme atau meniru akan menyebabkan markah ditolak atau dibatalkan."),
                        Text("🧠 Gunakan bahasa yang sopan dan lengkap."),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),

                  // BACK and NEXT buttons aligned
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      bottom: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // BACK button
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back_ios,
                              color: Colors.white, size: 18),
                          label: const Text(
                            'BACK',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        // NEXT button
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 153, 216, 81),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Quiz1Page(),
                              ),
                            );
                          },
                          icon: const Icon(Icons.arrow_forward_ios,
                              color: Colors.white, size: 18),
                          label: const Text(
                            'NEXT',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
