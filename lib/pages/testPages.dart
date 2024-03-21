import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class test extends StatelessWidget {
  const test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: Container(
        width: 100,
        height: 100,
        color: Colors.yellow,
        constraints: BoxConstraints(maxHeight: 100, maxWidth: 100),
        child: Column(
          children: [
            Expanded(
              child: MaterialButton(
                onPressed: () {},
                color: Colors.blue,
                padding: EdgeInsets.zero,
              ),
            ),
            Expanded(
              child: MaterialButton(
                onPressed: () {},
                color: Colors.blue,
                padding: EdgeInsets.zero,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
