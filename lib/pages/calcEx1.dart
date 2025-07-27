// ignore_for_file: file_names

import 'package:calc_steps_mobile/util/stepsButton.dart';
import 'package:flutter/material.dart';

// calculator FX570Ex

class CalcEx1 extends StatefulWidget {
  final Function(int) onUpdateImageIndex;

  final int currentStep;

  CalcEx1({
    super.key,
    required this.onUpdateImageIndex,
    required this.currentStep,
  });

  @override
  State<CalcEx1> createState() => _CalcEx1State();
}

class _CalcEx1State extends State<CalcEx1> {
  int currentStep = 0;

  void onClick(int i) {
    setState(() {
      currentStep = i;
    });

    widget.onUpdateImageIndex(i);
  }

  @override
  void initState() {
    super.initState();
    currentStep = widget.currentStep;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        StepsButton(
          text: "1",
          onPressed: () => setState(() {
            onClick(0);
          }),
          isClicked: currentStep == 0,
          isFirstLast: 1,
        ),

        //step 2
        StepsButton(
          text: "2",
          onPressed: () => setState(() {
            onClick(1);
          }),
          isClicked: currentStep == 1,
          isFirstLast: 0,
        ),

        //step 3
        StepsButton(
          text: "3",
          onPressed: () => setState(() {
            onClick(2);
          }),
          isClicked: currentStep == 2,
          isFirstLast: 0,
        ),

        //step 4
        StepsButton(
          text: "4",
          onPressed: () => setState(() {
            onClick(3);
          }),
          isClicked: currentStep == 3,
          isFirstLast: 0,
        ),

        //step 5
        StepsButton(
          text: "5",
          onPressed: () => setState(() {
            onClick(4);
          }),
          isClicked: currentStep == 4,
          isFirstLast: 0,
        ),

        //step 6
        StepsButton(
          text: "6",
          onPressed: () => setState(() {
            onClick(5);
          }),
          isClicked: currentStep == 5,
          isFirstLast: 2,
        ),
      ],
    );
  }
}
