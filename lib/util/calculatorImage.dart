import 'package:flutter/material.dart';
import 'package:calc_steps_mobile/util/CommonClass.dart';

class CalculatorImage extends StatelessWidget {
  final TutorialStep step;

  CalculatorImage({required this.step});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      step.stepImage.replaceFirst('../../', ''), // optional: normalize path
      width: double.infinity,
      gaplessPlayback: true,
      errorBuilder: (context, error, stackTrace) => Center(
        child: Text('Image not found', style: TextStyle(color: Colors.red)),
      ),
    );
  }
}
