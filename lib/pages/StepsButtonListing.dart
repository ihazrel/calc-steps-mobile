import 'package:calc_steps_mobile/util/stepsButton.dart';
import 'package:flutter/material.dart';

class CalcStepPage extends StatefulWidget {
  final Function(int) onUpdateImageIndex;
  final int currentStep;
  final int stepsCount;

  const CalcStepPage({
    super.key,
    required this.onUpdateImageIndex,
    required this.currentStep,
    required this.stepsCount,
  });

  @override
  State<CalcStepPage> createState() => _CalcStepPageState();
}

class _CalcStepPageState extends State<CalcStepPage> {
  late int currentStep;

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
      children: List.generate(widget.stepsCount, (index) {
        return StepsButton(
          text: "${index + 1}",
          onPressed: () => onClick(index),
          isClicked: currentStep == index,
          // isFirstLast: index == 0 ? 1 : (index == widget.stepsCount - 1 ? 2 : 0),
        );
      }),
    );
  }
}
