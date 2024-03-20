import 'package:calc_steps_mobile/util/stepsButton.dart';
import 'package:flutter/material.dart';

// calculator FX570MS

class Calculator2 extends StatefulWidget {
  final Function(int) onUpdateImageIndex;

  Calculator2({Key? key, required this.onUpdateImageIndex}) : super(key: key);

  @override
  State<Calculator2> createState() => _Calculator2State();
}

class _Calculator2State extends State<Calculator2> {
  var clickedList = [true, false, false];

  void onClick(int i) {
    // Reset clickedList
    for (int j = 0; j < clickedList.length; j++) {
      clickedList[j] = false;
    }

    // Set the clicked button to true
    clickedList[i] = true;

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
          text: "1. Press number of your base",
          onPressed: () => setState(() {
            onClick(0);
          }),
          onCurrent: true,
          isClicked: clickedList[0],
          isFirstLast: 1,
        ),

        //step 2
        StepsButton(
          text: "2. Press on the variable X with square on top",
          onPressed: () => setState(() {
            onClick(1);
          }),
          onCurrent: false,
          isClicked: clickedList[1],
          isFirstLast: 0,
        ),

        //step 3
        StepsButton(
          text: "3. Press the number for power needed",
          onPressed: () => setState(() {
            onClick(2);
          }),
          onCurrent: false,
          isClicked: clickedList[2],
          isFirstLast: 2,
        ),
      ],
    );
  }
}
