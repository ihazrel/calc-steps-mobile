import 'package:calc_steps_mobile/pages/about.dart';
import 'package:calc_steps_mobile/pages/calcEx1.dart';
import 'package:calc_steps_mobile/pages/calcEx2.dart';
import 'package:calc_steps_mobile/pages/calcEx3.dart';
import 'package:calc_steps_mobile/pages/calcMs1.dart';
import 'package:calc_steps_mobile/pages/calcMs2.dart';
import 'package:calc_steps_mobile/pages/calcMs3.dart';
import 'package:calc_steps_mobile/pages/settings.dart';
import 'package:calc_steps_mobile/util/dropdownHomepage.dart';
import 'package:calc_steps_mobile/util/stepsBackground.dart';
import 'package:flutter/material.dart';

class StepsPage extends StatefulWidget {
  final int initialCalculatorIndex;
  final int initialFormulaIndex;
  final int initialPageIndex;

  const StepsPage(
      {Key? key,
      required this.initialPageIndex,
      required this.initialFormulaIndex,
      required this.initialCalculatorIndex})
      : super(key: key);

  @override
  State<StepsPage> createState() => _StepsPageState();
}

class _StepsPageState extends State<StepsPage> {
  int _calculatorIndex = 0;
  int _formulaIndex = 0;
  int _imageIndex = 0;
  int _pageIndex = 0;
  int currentStep = 0;

  String titleText = "";
  String instructionsText = "";

  void rebuildCalcEx1() {
    setState(() {});
  }

  void updateStep(int step) {
    setState(() {
      currentStep = step;
    });
  }

  void nextStep() {
    setState(() {
      if (currentStep < 5) {
        currentStep++;
        rebuildCalcEx1();
      }
    });
    print(currentStep);
  }

  void previousStep() {
    setState(() {
      if (currentStep > 0) {
        currentStep--;
        rebuildCalcEx1();
      }
    });
    print(currentStep);
  }

  @override
  void initState() {
    super.initState();
    _pageIndex = widget.initialPageIndex;
    _formulaIndex = widget.initialFormulaIndex;
    _calculatorIndex = widget.initialCalculatorIndex;
    print(_pageIndex);
  }

  late List<Widget> _pages = [
    // Ex Factorize
    CalcEx1(
      onUpdateImageIndex: updateStep,
      currentStep: currentStep,
      rebuildCallBack: rebuildCalcEx1,
    ),

    // Ex Root
    CalcEx2(
      onUpdateImageIndex: updateStep,
    ),

    // Ex Exponent
    CalcEx3(
      onUpdateImageIndex: updateStep,
    ),

    // MS Factorize
    CalcMs1(
      onUpdateImageIndex: updateStep,
    ),

    // MS Root
    CalcMs2(
      onUpdateImageIndex: updateStep,
    ),

    // MS Exponent
    CalcMs3(
      onUpdateImageIndex: updateStep,
    ),
  ];

  List<String> instructionsListEx = [
    //factorize
    'Press SETUP button',
    "Press '(-)' button for Equation",
    "Press '2' for polynomial",
    'Press the highest power of equation',
    'Enter value for a, b, and c',
    "Press '=' button for 1st and 2nd value",
    //root
    "Enter a number for root value",
    "Press SHIFT and 'ϰ' button",
    "Enter the number you desired",
    "Press '=' button for the value",
    //power
    "Enter a number for base ",
    "Press 'ϰ' button",
    "Enter the number for power",
    "Press '=' button for the value",
  ];

  List<String> instructionsListMs = [
    //factorize
    'Press MODE button 3 times',
    "Press '1' for EQN",
    "Press RIGHT button on navigation pad",
    "Press the highest power of equation",
    "Enter value for a, b, and c",
    "Press '=' button for 1st and 2nd value",
    //root
    "Enter a number for root value",
    "Press SHIFT and '∧' button",
    "Enter the number you desired",
    "Press '=' button for the value",
    //power
    "Enter a number for base ",
    "Press '∧' button",
    "Enter the number for power",
    "Press '=' button for the value",
  ];

  @override
  Widget build(BuildContext context) {
    switch (_formulaIndex) {
      case 0:
        titleText = "FACTORIZE";
      case 1:
        titleText = "POWER ROOT";
      case 2:
        titleText = "EXPONENT";
    }
    switch (_calculatorIndex) {
      case 0:
        switch (_formulaIndex) {
          case 0:
            instructionsText = instructionsListEx[currentStep];
          case 1:
            instructionsText = instructionsListEx[currentStep + 6];
          case 2:
            instructionsText = instructionsListEx[currentStep + 10];
        }
      case 1:
        switch (_formulaIndex) {
          case 0:
            instructionsText = instructionsListMs[currentStep];
          case 1:
            instructionsText = instructionsListMs[currentStep + 6];
          case 2:
            instructionsText = instructionsListMs[currentStep + 10];
        }
    }
    //
    return Scaffold(
      backgroundColor: Color(0xFFECDEDE),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          titleText,
          style: TextStyle(fontSize: 32, fontFamily: 'Lato'),
        ),
      ),
      drawer: stepsPageDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(height: 40, child: _pages[_pageIndex]),

            // text
            Container(
              padding: EdgeInsets.only(top: 15, bottom: 15, right: 5, left: 5),
              alignment: Alignment.center,
              width: double.infinity,
              color: Color(0xFFD1A7A0),
              child: Text(
                instructionsText,
                style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),

            // picture
            Expanded(
              child: StepsBackground(
                imageIndex: currentStep,
                calculatorIndex: _calculatorIndex,
                formulaIndex: _formulaIndex,
                onNextPressed: nextStep,
                onPreviousPressed: previousStep,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Drawer stepsPageDrawer() {
    return Drawer(
      backgroundColor: Color(0xFFECDEDE),
      child: ListView(
        padding: EdgeInsets.only(top: 25, left: 25, right: 25),
        children: <Widget>[
          DropdownHomepage(
            onCalculatorIndexChanged: (int index) {
              setState(
                () {
                  _imageIndex = 0;
                  _calculatorIndex = index;
                  _formulaIndex = _formulaIndex;

                  switch (_calculatorIndex) {
                    case 0:
                      switch (_formulaIndex) {
                        case 0:
                          _pageIndex = 0;
                        case 1:
                          _pageIndex = 1;
                        case 2:
                          _pageIndex = 2;
                      }
                    case 1:
                      switch (_formulaIndex) {
                        case 0:
                          _pageIndex = 3;
                        case 1:
                          _pageIndex = 4;
                        case 2:
                          _pageIndex = 5;
                      }
                  }
                },
              );
            },
            onFormulaIndexChanged: (int index) {
              setState(() {
                _imageIndex = 0;
                _formulaIndex = index;

                switch (_calculatorIndex) {
                  case 0:
                    switch (_formulaIndex) {
                      case 0:
                        _pageIndex = 0;
                      case 1:
                        _pageIndex = 1;
                      case 2:
                        _pageIndex = 2;
                    }
                  case 1:
                    switch (_formulaIndex) {
                      case 0:
                        _pageIndex = 3;
                      case 1:
                        _pageIndex = 4;
                      case 2:
                        _pageIndex = 5;
                    }
                }
              });
            },
          ),

          //
          /* GoButton(
            calculatorIndex: _calculatorIndex,
            formulaIndex: _formulaIndex,
          ), */
          const Divider(
            color: Colors.black45,
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const Settings()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.medical_information),
            title: const Text('About'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const About()),
              );
            },
          ),
        ],
      ),
    );
  }
}
