import 'package:calc_steps_mobile/pages/about.dart';
import 'package:calc_steps_mobile/pages/calcEx1.dart';
import 'package:calc_steps_mobile/pages/calcEx2.dart';
import 'package:calc_steps_mobile/pages/calcEx3.dart';
import 'package:calc_steps_mobile/pages/calcMs1.dart';
import 'package:calc_steps_mobile/pages/calcMs2.dart';
import 'package:calc_steps_mobile/pages/calcMs3.dart';
import 'package:calc_steps_mobile/pages/homepage.dart';
import 'package:calc_steps_mobile/util/CommonData.dart';
import 'package:calc_steps_mobile/util/CommonClass.dart';
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
      _updateSteps();
    });
  }

  void nextStep() {
    setState(() {
      if (currentStep < currentSteps.length - 1) {
        currentStep++;
        _updatePages();
        _updateSteps();
      }
    });
  }

  void previousStep() {
    setState(() {
      if (currentStep > 0) {
        currentStep--;
        _updatePages();
        _updateSteps();
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
    _updateSteps();
  }

  late List<Widget> _pages;

  void _updatePages() {
    _pages = [
      CalcEx1(
          key: UniqueKey(),
          onUpdateImageIndex: updateStep,
          currentStep: currentStep),
      CalcEx2(
          key: UniqueKey(),
          onUpdateImageIndex: updateStep,
          currentStep: currentStep),
      CalcEx3(
          key: UniqueKey(),
          onUpdateImageIndex: updateStep,
          currentStep: currentStep),
      CalcMs1(
          key: UniqueKey(),
          onUpdateImageIndex: updateStep,
          currentStep: currentStep),
      CalcMs2(
          key: UniqueKey(),
          onUpdateImageIndex: updateStep,
          currentStep: currentStep),
      CalcMs3(
          key: UniqueKey(),
          onUpdateImageIndex: updateStep,
          currentStep: currentStep),
    ];

    _updateSteps();
  }

  void _updateSteps() {
    currentSteps = tutorialSteps.where((step) {
      return step.calculatorModelId == _calculatorIndex + 1 &&
          step.operationId == _formulaIndex + 1;
    }).toList();
  }

  late List<TutorialStep> currentSteps;

  @override
  Widget build(BuildContext context) {
    titleText =
        "${calculatorModels[_calculatorIndex].name} - ${operations[_formulaIndex].name}";
    instructionsText = currentSteps[currentStep].stepText;
    // Update the instructions text based on the current step
    if (currentSteps.isEmpty) {
      instructionsText = "No steps available for this combination.";
    } else if (currentStep >= currentSteps.length) {
      currentStep = currentSteps.length - 1; // Ensure we don't go out of bounds
      instructionsText = currentSteps[currentStep].stepText;
    }

    //
    return Scaffold(
      backgroundColor: const Color(0xFFECDEDE),
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
        color: const Color(0xFFD1A7A0), // Set the background color here
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(height: 40, child: _pages[_pageIndex]),

              // text
              Container(
                padding: EdgeInsets.all(12),
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  instructionsText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 29, 29, 29),
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
                  currentSteps: currentSteps,
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
              selectedCalculatorIndex: _calculatorIndex,
              selectedFormulaIndex: _formulaIndex,
              onCalculatorIndexChanged: (int index) {
                setState(() {
                  _calculatorIndex = index;
                  currentStep = 0;
                  _updateSteps();
                  _updatePages();
                });
              },
              onFormulaIndexChanged: (int index) {
                setState(() {
                  _formulaIndex = index;
                  currentStep = 0;
                  _updateSteps();
                  _updatePages();
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            const Divider(
              color: Colors.black45,
            ),
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
