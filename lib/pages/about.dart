import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About CalcSteps"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor:
            Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5),
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('image/svg/2.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Container(
            color: const Color(0xFFECDEDE).withOpacity(0.85),
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "🧮 About CalcSteps",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "CalcSteps is a mobile application designed to help students learn and understand the step-by-step process of solving mathematical problems.",
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Developed by a student from Universiti Teknologi MARA, this app serves as an educational companion for those who want to strengthen their math-solving skills.",
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "⚠️ Disclaimer",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "All calculator interfaces and functionalities within the app are inspired by popular Casio scientific calculators to provide a familiar experience for users. However, CalcSteps is not affiliated with, endorsed by, or connected to Casio Computer Co., Ltd. in any way. Any trademarks or product names mentioned are the property of their respective owners and are used for educational and descriptive purposes only.",
                    style: TextStyle(fontSize: 15, height: 1.5),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "📬 Contact Us",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "We welcome any feedback, suggestions, or inquiries. Please feel free to contact us at:",
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  SelectableText(
                    "ihazrel@gmail.com",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Center(
                    child: Text(
                      "Thank you for using CalcSteps!",
                      style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
