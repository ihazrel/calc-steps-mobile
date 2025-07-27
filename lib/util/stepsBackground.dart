import 'package:flutter/material.dart';
import 'package:calc_steps_mobile/util/calculatorImage.dart';
import 'package:calc_steps_mobile/util/CommonClass.dart';

class StepsBackground extends StatelessWidget {
  final VoidCallback onNextPressed;
  final VoidCallback onPreviousPressed;

  final int calculatorIndex;
  final int formulaIndex;
  final int imageIndex;
  final List<TutorialStep> currentSteps;

  const StepsBackground({
    super.key,
    required this.calculatorIndex,
    required this.formulaIndex,
    required this.imageIndex,
    required this.currentSteps,
    required this.onNextPressed,
    required this.onPreviousPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 20),
      decoration: const BoxDecoration(
        color: Color(0xFFD1A7A0),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: Stack(
        children: [
          // Calculator image display
          CalculatorImage(
            step: currentSteps[imageIndex],
          ),

          // Left Tap Zone
          Positioned.fill(
            child: Row(
              children: [
                // Previous zone
                Expanded(
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: onPreviousPressed,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: const Icon(
                        Icons.arrow_back_ios,
                        size: 24,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),

                // Next zone
                Expanded(
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: onNextPressed,
                    child: Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        size: 24,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
