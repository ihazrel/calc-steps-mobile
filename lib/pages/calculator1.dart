import 'package:calc_steps_mobile/util/stepsButton.dart';
import 'package:flutter/material.dart';

// calculator FX570Ex

class Calculator1 extends StatefulWidget {
  final Function(int) onUpdateImageIndex;

  Calculator1({Key? key, required this.onUpdateImageIndex}) : super(key: key);

  @override
  State<Calculator1> createState() => _Calculator1State();
}

class _Calculator1State extends State<Calculator1> {
  var clickedList = [true, false, false, false];
  List<int> besideList = [0, 1, 0, 0];

  void updateBesideList(int i) {
    // Update besideList based on the index i

    // Clear the besideList
    for (int j = 0; j < besideList.length; j++) {
      besideList[j] = 0;
    }

    // Update besideList based on the clicked index i
    besideList[i] = 0;

    if (i == 3) {
      besideList[i - 1] = 2;
    } else if (i > 0) {
      besideList[i - 1] = 2;
      besideList[i + 1] = 1;
    } else if (i == 0) {
      besideList[i + 1] = 1;
    }
  }

  void onClick(int i) {
    // Reset clickedList
    for (int j = 0; j < clickedList.length; j++) {
      clickedList[j] = false;
    }

    clickedList[i] = true;

    updateBesideList(i);

    widget.onUpdateImageIndex(i);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //step 1
        StepsButton(
          text: "1. Press SETUP button",
          onPressed: () => setState(() {
            onClick(0);
          }),
          onCurrent: true,
          isClicked: clickedList[0],
          isFirstLast: 1,
          isBesideClicked: besideList[0],
        ),

        //step 2
        StepsButton(
          text: "2. Press (-) button to access Equation / Function",
          onPressed: () => setState(() {
            onClick(1);
          }),
          onCurrent: false,
          isClicked: clickedList[1],
          isFirstLast: 0,
          isBesideClicked: besideList[1],
        ),

        //step 3
        StepsButton(
          text: "3. Press 2 for Polynomial",
          onPressed: () => setState(() {
            onClick(2);
          }),
          onCurrent: false,
          isClicked: clickedList[2],
          isFirstLast: 0,
          isBesideClicked: besideList[2],
        ),

        //step 4
        StepsButton(
          text: "4.Press number of highest power of the equation",
          onPressed: () => setState(() {
            onClick(3);
          }),
          onCurrent: false,
          isClicked: clickedList[3],
          isFirstLast: 2,
          isBesideClicked: besideList[3],
        ),
      ],
    );
  }
}
