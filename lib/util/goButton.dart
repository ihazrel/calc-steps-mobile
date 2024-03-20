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
          elevation: MaterialStateProperty.all(0),
          minimumSize: MaterialStateProperty.all(Size(130, 40))),
      child: Text(
        'Go',
        style: TextStyle(fontSize: 25),
      ),
      onPressed: () {
        if (calculatorIndex != null && formulaIndex != null) {
          Navigator.pushNamed(context, '/stepspage');
        } else
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              contentPadding: EdgeInsets.all(5),
              content: const Text('You must choose \ncalculator and formula'),
            ),
          );
      },
    );
  }
}
