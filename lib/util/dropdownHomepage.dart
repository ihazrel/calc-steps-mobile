import 'package:flutter/material.dart';
import 'package:calc_steps_mobile/util/CommonClass.dart';
import 'package:calc_steps_mobile/util/CommonData.dart';

class DropdownHomepage extends StatefulWidget {
  final void Function(int)? onCalculatorIndexChanged;
  final void Function(int)? onFormulaIndexChanged;
  final int selectedCalculatorIndex;
  final int selectedFormulaIndex;

  const DropdownHomepage({
    super.key,
    required this.onCalculatorIndexChanged,
    required this.onFormulaIndexChanged,
    required this.selectedCalculatorIndex,
    required this.selectedFormulaIndex,
  });

  @override
  State<DropdownHomepage> createState() => _DropdownHomepageState();
}

class _DropdownHomepageState extends State<DropdownHomepage> {
  CalculatorModel? selectedCalculator;
  Operation? selectedOperation;

  double calculateFontSize(double buttonWidth) {
    const double fontSizeFactor = 12.0;
    return buttonWidth / fontSizeFactor;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          // Calculator dropdown
          LayoutBuilder(
            builder: (context, constraints) {
              double buttonWidth = constraints.maxWidth;
              double fontSize = calculateFontSize(buttonWidth);

              return Container(
                width: 300,
                decoration: BoxDecoration(
                  color: Color(0xFFCE96A6),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: DropdownButton<CalculatorModel>(
                  padding: EdgeInsets.only(left: 50, right: 25),
                  isExpanded: true,
                  hint: Text(
                    'Calculator',
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Lato',
                      color: Color(0xFFE2E2E2),
                    ),
                  ),
                  borderRadius: BorderRadius.circular(32),
                  itemHeight: 60,
                  value: selectedCalculator,
                  underline: Container(),
                  icon: Icon(Icons.keyboard_arrow_down),
                  elevation: 0,
                  items: calculatorModels.map((CalculatorModel model) {
                    return DropdownMenuItem<CalculatorModel>(
                      value: model,
                      child: Text(
                        model.name,
                        style: TextStyle(
                          fontSize: fontSize,
                          color: Colors.black,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (CalculatorModel? newModel) {
                    if (newModel != null) {
                      setState(() {
                        selectedCalculator = newModel;
                        widget.onCalculatorIndexChanged
                            ?.call(calculatorModels.indexOf(newModel));
                      });
                    }
                  },
                ),
              );
            },
          ),
          SizedBox(height: 38),

          // Formula dropdown
          LayoutBuilder(
            builder: (context, constraints) {
              double buttonWidth = constraints.maxWidth;
              double fontSize = calculateFontSize(buttonWidth);

              return Container(
                width: 300,
                decoration: BoxDecoration(
                  color: Color(0xFFCE96A6),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: DropdownButton<Operation>(
                  padding: EdgeInsets.only(left: 50, right: 25),
                  isExpanded: true,
                  hint: Text(
                    'Formula',
                    style: TextStyle(
                      fontSize: 25,
                      color: Color(0xFFE2E2E2),
                    ),
                  ),
                  borderRadius: BorderRadius.circular(32),
                  itemHeight: 60,
                  value: selectedOperation,
                  underline: Container(),
                  icon: Icon(Icons.keyboard_arrow_down),
                  elevation: 0,
                  items: operations.map((Operation op) {
                    return DropdownMenuItem<Operation>(
                      value: op,
                      child: Text(
                        op.name,
                        style: TextStyle(
                          fontSize: fontSize,
                          color: Colors.black,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (Operation? newOp) {
                    if (newOp != null) {
                      setState(() {
                        selectedOperation = newOp;
                        widget.onFormulaIndexChanged
                            ?.call(operations.indexOf(newOp));
                      });
                    }
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
