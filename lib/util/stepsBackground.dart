import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StepsBackground extends StatefulWidget {
  const StepsBackground({super.key});

  @override
  State<StepsBackground> createState() => _StepsBackgroundState();
}

class _StepsBackgroundState extends State<StepsBackground> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        height: 681,
        child: Column(
          children: [
            Container(
              height: 96,
              decoration: BoxDecoration(
                  color: Color(0xFFD8D8D8),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  )),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFD1A7A0),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
