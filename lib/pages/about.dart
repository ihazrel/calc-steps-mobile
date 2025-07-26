import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECDEDE),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Image.asset(
            'image/svg/2.png',
            width: double.infinity,
            fit: BoxFit.fill,
            gaplessPlayback: true,
          ),
          Container(
            padding: EdgeInsets.all(35),
            child: Text(
              "CalcSteps aims to teach student on calculating steps in solving mathematical problems. \n\n This app is developed by a student from Universiti Teknologi Malaysia.\n\n We hope that this app will help students to understand the steps in solving mathematical problems. \n\n Any feedback is welcomed. Please contact us at ihazrel@gmail.com \n\n Thank you for using CalcSteps.",
              style: TextStyle(
                fontSize: 20,
                fontFamily: GoogleFonts.lato().fontFamily,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
