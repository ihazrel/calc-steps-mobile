import 'package:calc_steps_mobile/pages/about.dart';
import 'package:calc_steps_mobile/pages/calcEx1.dart';
import 'package:calc_steps_mobile/pages/calcEx2.dart';
import 'package:calc_steps_mobile/pages/calcEx3.dart';
import 'package:calc_steps_mobile/pages/calcMs1.dart';
import 'package:calc_steps_mobile/pages/calcMs2.dart';
import 'package:calc_steps_mobile/pages/calcMs3.dart';
import 'package:calc_steps_mobile/pages/homepage.dart';
import 'package:calc_steps_mobile/util/dropdownHomepage.dart';
import 'package:calc_steps_mobile/util/stepsBackground.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      _updatePages();
    });
  }

  void nextStep() {
    setState(() {
      int stepLimit = 0;

      switch (_calculatorIndex) {
        case 0:
          switch (_formulaIndex) {
            case 0:
              stepLimit = 5;
            case 1:
              stepLimit = 3;
            case 2:
              stepLimit = 3;
          }
        case 1:
          switch (_formulaIndex) {
            case 0:
              stepLimit = 5;
            case 1:
              stepLimit = 3;
            case 2:
              stepLimit = 3;
          }
      }

      if (currentStep < stepLimit) {
        currentStep++;
        _updatePages();
      }
    });
  }

  void previousStep() {
    setState(() {
      if (currentStep > 0) {
        currentStep--;
        _updatePages();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _pageIndex = widget.initialPageIndex;
    _formulaIndex = widget.initialFormulaIndex;
    _calculatorIndex = widget.initialCalculatorIndex;
    _updatePages();
  }

  late List<Widget> _pages;

  void _updatePages() {
    _pages = [
      // Ex Factorize
      CalcEx1(
        key: UniqueKey(),
        onUpdateImageIndex: updateStep,
        currentStep: currentStep,
      ),

      // Ex Root
      CalcEx2(
        key: UniqueKey(),
        onUpdateImageIndex: updateStep,
        currentStep: currentStep,
      ),

      // Ex Exponent
      CalcEx3(
        key: UniqueKey(),
        onUpdateImageIndex: updateStep,
        currentStep: currentStep,
      ),

      // MS Factorize
      CalcMs1(
        key: UniqueKey(),
        onUpdateImageIndex: updateStep,
        currentStep: currentStep,
      ),

      // MS Root
      CalcMs2(
        key: UniqueKey(),
        onUpdateImageIndex: updateStep,
        currentStep: currentStep,
      ),

      // MS Exponent
      CalcMs3(
        key: UniqueKey(),
        onUpdateImageIndex: updateStep,
        currentStep: currentStep,
      ),
    ];
  }

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
    "Press RIGHT button to next page",
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
    switch (_calculatorIndex) {
      case 0:
        titleText = "fx-570EX";
        switch (_formulaIndex) {
          case 0:
            titleText += " Factorize";
          case 1:
            titleText += " Roots";
          case 2:
            titleText += " Exponent";
        }
      case 1:
        titleText = "fx-570MS";
        switch (_formulaIndex) {
          case 0:
            titleText += " Factorization";
          case 1:
            titleText += " Roots";
          case 2:
            titleText += " Exponent";
        }
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
          style: TextStyle(
            fontSize: 25,
            fontFamily: GoogleFonts.heebo().fontFamily,
          ),
        ),
      ),
      drawer: stepsPageDrawer(),
      body: Container(
        color: Color(0xFFD1A7A0), // Set the background color here
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(height: 40, child: _pages[_pageIndex]),

              // text
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: Center(
                  child: Text(
                    instructionsText,
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w800),
                  ),
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
      ),
    );
  }

  GestureDetector stepsPageDrawer() {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Drawer(
        backgroundColor: Color(0xFFECDEDE),
        child: ListView(
          padding: EdgeInsets.only(top: 25, left: 25, right: 25),
          children: <Widget>[
            DropdownHomepage(
              onCalculatorIndexChanged: (int index) {
                setState(
                  () {
                    currentStep = 0;
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
                    _updatePages();
                  },
                );
              },
              onFormulaIndexChanged: (int index) {
                setState(() {
                  currentStep = 0;
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
                  _updatePages();
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
            /* ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const Settings()),
              );
            },
          ), */
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const HomePage()));
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
      ),
    );
  }
}
