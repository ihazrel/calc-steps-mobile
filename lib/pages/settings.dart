import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECDEDE),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Image.asset(
        'image2/svg/2.png',
        width: double.infinity,
        fit: BoxFit.fill,
        gaplessPlayback: true,
      ),
    );
  }
}
