import 'package:calc_steps_mobile/util/stepsButton.dart';
import 'package:flutter/material.dart';

// calculator FX570MS

class CalcEx2 extends StatefulWidget {
  final Function(int) onUpdateImageIndex;

  CalcEx2({Key? key, required this.onUpdateImageIndex}) : super(key: key);

  @override
  State<CalcEx2> createState() => _CalcEx2State();
}

class _CalcEx2State extends State<CalcEx2> {
  var clickedList = [true, false, false, false, false, false];

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
    return Row(
      children: [
        //step 1
        StepsButton(
          text: "1",
          onPressed: () => setState(() {
            onClick(0);
          }),
          isClicked: clickedList[0],
          isFirstLast: 1,
        ),

        //step 2
        StepsButton(
          text: "2",
          onPressed: () => setState(() {
            onClick(1);
          }),
          isClicked: clickedList[1],
          isFirstLast: 0,
        ),

        //step 3
        StepsButton(
          text: "3",
          onPressed: () => setState(() {
            onClick(2);
          }),
          isClicked: clickedList[2],
          isFirstLast: 0,
        ),

        //step 4
        StepsButton(
          text: "4",
          onPressed: () => setState(() {
            onClick(3);
          }),
          isClicked: clickedList[3],
          isFirstLast: 2,
        ),
      ],
    );
  }
}
