import 'package:calc_steps_mobile/util/stepsButton.dart';
import 'package:flutter/material.dart';

// calculator FX570MS

class Calculator4 extends StatefulWidget {
  final Function(int) onUpdateImageIndex;

  Calculator4({Key? key, required this.onUpdateImageIndex}) : super(key: key);

  @override
  State<Calculator4> createState() => _Calculator4State();
}

class _Calculator4State extends State<Calculator4> {
  var clickedList = [true, false, false, false, false];
  List<int> besideList = [0, 1, 0, 0, 0];

  void updateBesideList(int i) {
    // Update besideList based on the index i

    // Clear the besideList
    for (int j = 0; j < besideList.length; j++) {
      besideList[j] = 0;
    }

    // Update besideList based on the clicked index i
    besideList[i] = 0;

    if (i == 4) {
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

    // Set the clicked button to true
    clickedList[i] = true;

    // Update the besideList after the button is clicked
    updateBesideList(i);

    // update imageIndex
    widget.onUpdateImageIndex(i);

    // Print out the contents of the besideList for debugging
    /* for (int j = 0; j < besideList.length; j++) {
      print("$i$j" + ", " + besideList[j].toString());
    }
    print("=============="); */
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //step 1
        StepsButton(
          text: "1. Press ( to put number in bracket",
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
          text: "2. Press the number needed",
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
          text: "3. Press the ^ button for power",
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
          text: "4.Press the number for power needed",
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
          text: "5. Press ) to close the bracket",
          onPressed: () => setState(() {
            onClick(4);
          }),
          onCurrent: false,
          isClicked: clickedList[4],
          isFirstLast: 2,
          isBesideClicked: besideList[4],
        ),
      ],
    );
  }
}
