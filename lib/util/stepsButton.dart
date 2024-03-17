// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class StepsButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  final bool onCurrent;
  final int isFirstLast;
  final bool isClicked;
  final int isBesideClicked;

  StepsButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.onCurrent,
    required this.isClicked,
    required this.isFirstLast,
    required this.isBesideClicked,
  });

  @override
  Widget build(BuildContext context) {
    //clicked color

    Color buttonColor = Colors.black;
    if (isClicked)
      buttonColor = Color(0xFFD1A7A0);
    else if (!isClicked) {
      buttonColor = Color(0xFFE8E8E8);
    }

    // curved border first last
    BorderRadius round;
    if (isFirstLast == 1)
      round = BorderRadius.only(topLeft: Radius.circular(32));
    else if (isFirstLast == 2)
      round = BorderRadius.only(bottomLeft: Radius.circular(32));
    else
      round = BorderRadius.zero;

    // additional border properties
    if (isBesideClicked == 1)
      round = round.copyWith(topRight: Radius.circular(32));
    else if (isBesideClicked == 2)
      round = round.copyWith(bottomRight: Radius.circular(32));

    return Expanded(
      child: MaterialButton(
        onPressed: onPressed,
        child: Padding(
          padding:
              EdgeInsets.only(left: 20), // Set 10 pixels padding to the left
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              text,
              textAlign: TextAlign.start, // Set text alignment to start (left)
            ),
          ),
        ),
        color: buttonColor,
        shape: RoundedRectangleBorder(borderRadius: round),
        minWidth: 0,
        elevation: 0,
      ),
    );
  }
}
