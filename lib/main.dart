import 'package:calc_steps_mobile/pages/calculator1.dart';
import 'package:calc_steps_mobile/pages/homepage.dart';
import 'package:calc_steps_mobile/pages/stepsPage.dart';
import 'package:calc_steps_mobile/util/stepsButton.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StepsPage(),
      routes: {
        '/homepage': (context) => const HomePage(),
        '/stepspage': (context) => const StepsPage(),
      },
    );
  }
}
