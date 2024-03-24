import 'package:calc_steps_mobile/util/stepsButton.dart';
import 'package:flutter/material.dart';

// calculator FX570MS

class CalcEx2 extends StatefulWidget {
  final Function(int) onUpdateImageIndex;

  final int currentStep;

  CalcEx2({
    super.key,
    required this.onUpdateImageIndex,
    required this.currentStep,
  });

  @override
  State<CalcEx2> createState() => _CalcEx2State();
}

class _CalcEx2State extends State<CalcEx2> {
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
        //step 1
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
          isFirstLast: 2,
        ),
      ],
    );
  }
}
