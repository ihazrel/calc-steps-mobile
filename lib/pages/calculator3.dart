import 'package:calc_steps_mobile/util/stepsButton.dart';
import 'package:flutter/material.dart';

// calculator FX570Ex

class Calculator3 extends StatefulWidget {
  final Function(int) onUpdateImageIndex;

  Calculator3({Key? key, required this.onUpdateImageIndex}) : super(key: key);

  @override
  State<Calculator3> createState() => _Calculator3State();
}

class _Calculator3State extends State<Calculator3> {
  var clickedList = [true, false, false, false, false, false, false, false];
  List<int> besideList = [0, 1, 0, 0, 0, 0, 0, 0, 0];

  void updateBesideList(int i) {
    // Update besideList based on the index i

    // Clear the besideList
    for (int j = 0; j < besideList.length; j++) {
      besideList[j] = 0;
    }

    // Update besideList based on the clicked index i
    besideList[i] = 0;

    if (i == 7) {
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
          text: "1. Press SETUP button three times",
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
          text: "2. Press right to access Degree option",
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
          text: "3. Press 2",
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
          text: "4. Enter value A",
          onPressed: () => setState(() {
            onClick(3);
          }),
          onCurrent: false,
          isClicked: clickedList[3],
          isFirstLast: 0,
          isBesideClicked: besideList[3],
        ),

        //step 5
        StepsButton(
          text: "5. Enter value B",
          onPressed: () => setState(() {
            onClick(4);
          }),
          onCurrent: false,
          isClicked: clickedList[4],
          isFirstLast: 0,
          isBesideClicked: besideList[4],
        ),

        //step 6
        StepsButton(
          text: "6. Enter value C",
          onPressed: () => setState(() {
            onClick(5);
          }),
          onCurrent: false,
          isClicked: clickedList[5],
          isFirstLast: 0,
          isBesideClicked: besideList[5],
        ),

        //step 7
        StepsButton(
          text: "7. Press = button to see the first value",
          onPressed: () => setState(() {
            onClick(6);
          }),
          onCurrent: false,
          isClicked: clickedList[6],
          isFirstLast: 0,
          isBesideClicked: besideList[6],
        ),

        //step 8
        StepsButton(
          text: "8. Press = button to see the second value",
          onPressed: () => setState(() {
            onClick(7);
          }),
          onCurrent: false,
          isClicked: clickedList[7],
          isFirstLast: 2,
          isBesideClicked: besideList[7],
        ),
      ],
    );
  }
}
