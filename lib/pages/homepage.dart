import 'package:calc_steps_mobile/pages/About.dart';
import 'package:calc_steps_mobile/pages/settings.dart';
import 'package:calc_steps_mobile/util/dropdown.dart';
import 'package:calc_steps_mobile/util/goButton.dart';
import 'package:calc_steps_mobile/util/tutorialButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // variable
  var _calculatorIndex = null;
  var _formulaIndex = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECDEDE),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      drawer: mainPageDrawer(context),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 170),
              child: SizedBox(
                width: 300,
                child: Column(
                  children: [
                    // text
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Hi...",
                        style: TextStyle(fontSize: 82, fontFamily: 'Lato'),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),

                    // dropdown menu
                    Dropdown(
                      onCalculatorIndexChanged: (int index) {
                        setState(() {
                          _calculatorIndex = index;
                        });
                      },
                      onFormulaIndexChanged: (int index) {
                        setState(() {
                          _formulaIndex = index;
                        });
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    // go button
                    GoButton(
                      calculatorIndex: _calculatorIndex,
                      formulaIndex: _formulaIndex,
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    // tutorial button
                    TutorialButton(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Drawer mainPageDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xFFECDEDE),
      child: ListView(
        padding: EdgeInsets.only(top: 25, left: 25),
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Settings()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.medical_information),
            title: const Text('About'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => const About()));
            },
          )
        ],
      ),
    );
  }
}
