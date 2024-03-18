// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class GoButton extends StatelessWidget {
  var calculatorIndex = null;
  var formulaIndex = null;

  GoButton({
    super.key,
    required this.calculatorIndex,
    required this.formulaIndex,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll<Color>(Color(0xFFD1A7A0)),
        foregroundColor: MaterialStatePropertyAll<Color>(Colors.black),
        minimumSize: MaterialStateProperty.all(Size(125, 41)),
        elevation: MaterialStateProperty.all(0),
      ),
      child: Text(
        'Go',
        style: TextStyle(fontSize: 25),
      ),
      onPressed: () {
        if (calculatorIndex != null && formulaIndex != null) {
          Navigator.pushNamed(context, '/stepspage');
          print("calc" + calculatorIndex.toString());
          print("formula" + formulaIndex.toString());
        } else
          print("you must choose one");
      },
    );
  }
}
