import 'package:calc_steps_mobile/pages/about.dart';
import 'package:calc_steps_mobile/pages/settings.dart';
import 'package:calc_steps_mobile/util/dropdown.dart';
import 'package:calc_steps_mobile/util/homepageButton.dart';
import 'package:calc_steps_mobile/util/stepsBackground.dart';
import 'package:flutter/material.dart';

class StepsPage extends StatefulWidget {
  const StepsPage({super.key});

  @override
  State<StepsPage> createState() => _StepsPageState();
}

class _StepsPageState extends State<StepsPage> {
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
      body: StepsBackground(),
    );
  }

  Drawer stepsPageDrawer() {
    return Drawer(
      backgroundColor: Color(0xFFECDEDE),
      child: ListView(
        padding: EdgeInsets.only(top: 25, left: 25, right: 25),
        children: <Widget>[
          Dropdown(
              onCalculatorIndexChanged: (int index) {},
              onFormulaIndexChanged: (int index) {}),
          const Divider(
            color: Colors.black45,
          ),
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
          ),
        ],
      ),
    );
  }
}
