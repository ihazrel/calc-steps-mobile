import 'package:calc_steps_mobile/pages/about.dart';
import 'package:calc_steps_mobile/pages/calculator1.dart';
import 'package:calc_steps_mobile/pages/calculator2.dart';
import 'package:calc_steps_mobile/pages/calculator3.dart';
import 'package:calc_steps_mobile/pages/calculator4.dart';
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

  void handleButtonPressed(int index) {
    setState(() {
      _imageIndex = index;
    });
  }

  late List<Widget> _pages = [
    // Ex Factorize
    Calculator1(
      onUpdateImageIndex: handleButtonPressed,
    ),

    // Ex Power
    Calculator2(
      onUpdateImageIndex: handleButtonPressed,
    ),

    // MS Factorize
    Calculator3(
      onUpdateImageIndex: handleButtonPressed,
    ),

    // MS Power
    Calculator4(
      onUpdateImageIndex: handleButtonPressed,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECDEDE),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Factorize',
          style: TextStyle(fontSize: 40),
        ),
      ),
      drawer: stepsPageDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(height: 40, child: _pages[_pageIndex]),
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
              setState(() {
                _imageIndex = 0;
                _calculatorIndex = index;
                _formulaIndex = _formulaIndex;

                if (_formulaIndex == 0 && _calculatorIndex == 0) {
                  _pageIndex = 0;
                } else if (_formulaIndex == 1 && _calculatorIndex == 0) {
                  _pageIndex = 1;
                } else if (_formulaIndex == 0 && _calculatorIndex == 1) {
                  _pageIndex = 2;
                } else if (_formulaIndex == 1 && _calculatorIndex == 1) {
                  _pageIndex = 3;
                }
              });
            },
            onFormulaIndexChanged: (int index) {
              setState(() {
                _imageIndex = 0;
                _formulaIndex = index;

                if (_formulaIndex == 0 && _calculatorIndex == 0) {
                  _pageIndex = 0;
                } else if (_formulaIndex == 1 && _calculatorIndex == 0) {
                  _pageIndex = 1;
                } else if (_formulaIndex == 0 && _calculatorIndex == 1) {
                  _pageIndex = 2;
                } else if (_formulaIndex == 1 && _calculatorIndex == 1) {
                  _pageIndex = 3;
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
