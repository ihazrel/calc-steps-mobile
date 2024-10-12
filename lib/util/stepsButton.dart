// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class StepsButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  final int isFirstLast;
  final bool isClicked;

  StepsButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.isClicked,
    required this.isFirstLast,
  });

  @override
  Widget build(BuildContext context) {
    //clicked color

    Color buttonColor = Colors.black;
    if (!isClicked)
      buttonColor = Color(0xFFD1A7A0);
    else if (isClicked) {
      buttonColor = Color(0xFFE8E8E8);
    }

    // curved border first last
    BorderRadius round;
    round = BorderRadius.circular(32);
    // if (isFirstLast == 1)
    //   round = BorderRadius.only(
    //     topLeft: Radius.circular(32),
    //     bottomLeft: Radius.circular(32),
    //   );
    // else if (isFirstLast == 2)
    //   round = BorderRadius.only(
    //     topRight: Radius.circular(32),
    //     bottomRight: Radius.circular(32),
    //   );
    // else
    //   round = BorderRadius.zero;

    return Expanded(
      child: MaterialButton(
        onPressed: onPressed,
        child: Align(alignment: Alignment.center, child: Text(text)),
        color: buttonColor,
        shape: RoundedRectangleBorder(borderRadius: round),
        elevation: 0,
      ),
    );
  }
}
