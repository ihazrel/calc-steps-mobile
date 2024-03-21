import 'package:flutter/material.dart';

class CalculatorImage extends StatelessWidget {
  final int imageIndex;
  final int formulaIndex;
  final int calculatorIndex;

  final List<String> calcList = ['ex', 'ms'];
  final List<String> formulaList = ['factorize', 'root', 'exponent'];

  CalculatorImage({
    required this.imageIndex,
    required this.calculatorIndex,
    required this.formulaIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: loadImageAsset(),
    );
  }

  Widget loadImageAsset() {
    String imagePath = 'image2/';
    imagePath += '${calcList.elementAt(calculatorIndex)}/';
    imagePath += '${formulaList.elementAt(formulaIndex)}/';
    imagePath += '${imageIndex + 1}.png';

    return Image.asset(
      imagePath,
      width: 250,
      gaplessPlayback: true,
    );
  }
}
