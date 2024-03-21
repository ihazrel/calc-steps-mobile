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
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StepsPage extends StatefulWidget {
  const StepsPage({Key? key}) : super(key: key);

  @override
  State<StepsPage> createState() => _StepsPageState();
}

class _StepsPageState extends State<StepsPage> {
  int _calculatorIndex = 0;
  int _formulaIndex = 0;
  int _imageIndex = 0;
  int _pageIndex = 0;

  String titleText = "";

  void handleButtonPressed(int index) {
    setState(() {
      _imageIndex = index;
    });
  }

  late List<Widget> _pages = [
    // Ex Factorize
    CalcEx1(
      onUpdateImageIndex: handleButtonPressed,
    ),

    // Ex Root
    CalcEx2(
      onUpdateImageIndex: handleButtonPressed,
    ),

    // Ex Exponent
    CalcEx3(
      onUpdateImageIndex: handleButtonPressed,
    ),

    // MS Factorize
    CalcMs1(
      onUpdateImageIndex: handleButtonPressed,
    ),

    // MS Root
    CalcMs2(
      onUpdateImageIndex: handleButtonPressed,
    ),

    // MS Exponent
    CalcMs3(
      onUpdateImageIndex: handleButtonPressed,
    ),
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
    //
    return Scaffold(
      backgroundColor: Color(0xFFECDEDE),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          titleText,
          style: TextStyle(fontSize: 40),
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
              height: 30,
              width: double.infinity,
              color: Color(0xFFD1A7A0),
              alignment: Alignment.center,
              child: Text('Lorum Ipsum'),
            ),

            // picture
            Expanded(
              child: StepsBackground(
                imageIndex: _imageIndex,
                calculatorIndex: _calculatorIndex,
                formulaIndex: _formulaIndex,
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
