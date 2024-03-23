import 'package:calc_steps_mobile/util/calculatorImage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StepsBackground extends StatelessWidget {
  final int calculatorIndex;
  final int formulaIndex;
  final int imageIndex;

  const StepsBackground({
    required this.calculatorIndex,
    required this.formulaIndex,
    required this.imageIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Color(0xFFD1A7A0),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: Stack(
        children: [
          CalculatorImage(
            imageIndex: imageIndex,
            calculatorIndex: calculatorIndex,
            formulaIndex: formulaIndex,
          ),
          Row(
            children: [
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.transparent,
                  elevation: 0,
                  height: double.infinity,
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.transparent,
                  elevation: 0,
                  height: double.infinity,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
