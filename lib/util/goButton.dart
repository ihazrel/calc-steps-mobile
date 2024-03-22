// ignore_for_file: must_be_immutable

import 'package:calc_steps_mobile/pages/stepsPage.dart';
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
    int _intialPageIndex = 0;

    switch (calculatorIndex) {
      case 0:
        switch (formulaIndex) {
          case 0:
            _intialPageIndex = 0;
          case 1:
            _intialPageIndex = 1;
          case 2:
            _intialPageIndex = 2;
        }
      case 1:
        switch (formulaIndex) {
          case 0:
            _intialPageIndex = 3;
          case 1:
            _intialPageIndex = 4;
          case 2:
            _intialPageIndex = 5;
        }
    }

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
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => StepsPage(
                        initialPageIndex: _intialPageIndex,
                        initialCalculatorIndex: calculatorIndex,
                        initialFormulaIndex: formulaIndex,
                      )));
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
