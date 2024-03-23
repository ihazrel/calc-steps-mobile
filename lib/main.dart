import 'package:calc_steps_mobile/pages/homepage.dart';
import 'package:calc_steps_mobile/pages/settings.dart';
import 'package:calc_steps_mobile/pages/stepsPage.dart';
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
      home: StepsPage(
        initialCalculatorIndex: 0,
        initialFormulaIndex: 0,
        initialPageIndex: 0,
      ),
      routes: {
        '/homepage': (context) => const HomePage(),
      },
    );
  }
}
