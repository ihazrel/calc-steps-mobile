import 'package:flutter/material.dart';

class DropdownHomepage extends StatefulWidget {
  final void Function(int)? onCalculatorIndexChanged;
  final void Function(int)? onFormulaIndexChanged; // Define the callback

  DropdownHomepage({
    required this.onCalculatorIndexChanged,
    required this.onFormulaIndexChanged,
  });

  @override
  State<DropdownHomepage> createState() => _DropdownHomepageState();
}

class _DropdownHomepageState extends State<DropdownHomepage> {
  var calculatorDropdownValue = null;
  final List<String> calculatorDropdownItems = ['fx-570EX', 'fx-570MS'];

  var formulaDropdownValue = null;
  final List<String> formulaDropdownItems = [
    'Factorization',
    'Roots',
    'Exponent'
  ];

  int formulaIndex = 0;
  int calculatorIndex = 0;

  bool isCalculatorDropdownExpanded = false;
  bool isFormulaDropdownExpanded = false;
  bool isClicked = false;

  double calculateFontSize(double buttonWidth) {
    // Define your factor to adjust the font size
    const double fontSizeFactor = 12.0;
    return buttonWidth / fontSizeFactor;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          // calculator dropdown menu
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              double buttonWidth = constraints.maxWidth;
              double fontSize = calculateFontSize(buttonWidth);

              return Container(
                width: 300,
                decoration: BoxDecoration(
                  color: Color(0xFFCE96A6),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: DropdownButton<String>(
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
                  value: calculatorDropdownValue,
                  underline: Container(),
                  icon: Icon(Icons.keyboard_arrow_down),
                  elevation: 0,
                  items: calculatorDropdownItems.map((String list) {
                    return DropdownMenuItem(
                      value: list,
                      child: Text(
                        list,
                        style: TextStyle(
                          fontSize: fontSize,
                          color: Colors.black,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      // Check for null safety
                      setState(() {
                        calculatorDropdownValue = newValue;
                        calculatorIndex =
                            calculatorDropdownItems.indexOf(newValue);
                        if (widget.onCalculatorIndexChanged != null) {
                          widget.onCalculatorIndexChanged!(calculatorIndex);
                        }
                      });
                    }
                  },
                ),
              );
            },
          ),
          SizedBox(height: 38),

          // formula dropdown menu
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              double buttonWidth = constraints.maxWidth;
              double fontSize = calculateFontSize(buttonWidth);

              return Container(
                width: 300,
                decoration: BoxDecoration(
                  color: Color(0xFFCE96A6),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: DropdownButton<String>(
                  padding: EdgeInsets.only(left: 50, right: 25),
                  isExpanded: true,
                  borderRadius: BorderRadius.circular(32),
                  itemHeight: 60,
                  hint: const Text(
                    "Formula",
                    style: TextStyle(
                      fontSize: 25,
                      color: Color(0xFFE2E2E2),
                    ),
                  ),
                  value: formulaDropdownValue,
                  underline: Container(),
                  icon: Icon(Icons.keyboard_arrow_down),
                  items: formulaDropdownItems.map(
                    (String list) {
                      return DropdownMenuItem(
                        value: list,
                        child: Text(
                          list,
                          style: TextStyle(
                            fontSize: fontSize,
                            color: Colors.black,
                          ),
                        ),
                      );
                    },
                  ).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      formulaDropdownValue = newValue!;
                      formulaIndex = formulaDropdownItems.indexOf(newValue);
                      if (widget.onFormulaIndexChanged != null) {
                        widget.onFormulaIndexChanged!(formulaIndex);
                      }
                    });
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
