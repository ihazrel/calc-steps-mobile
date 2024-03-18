import 'package:flutter/material.dart';

class homepageButton extends StatelessWidget {
  const homepageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll<Color>(Color(0xFFECDEDE)),
        foregroundColor: MaterialStatePropertyAll<Color>(Colors.black),
        elevation: MaterialStateProperty.all(0),
      ),
      child: Text('Return to Home'),
      onPressed: () {
        Navigator.pushNamed(context, '/homepage');
      },
    );
  }
}
