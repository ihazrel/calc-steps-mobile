import 'package:flutter/material.dart';

class TutorialButton extends StatelessWidget {
  TutorialButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(elevation: MaterialStateProperty.all(0)),
      child: const Text(
        "How To Use?",
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Close"),
              ),
            ],
            title: const Text(
              "How To Use?",
              style: TextStyle(color: Colors.black),
            ),
            contentPadding: const EdgeInsets.all(8.0),
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                "1. Choose the calculator\n2. Choose the formula needed\n3. Click on the steps to navigate\n4. Buttons mentioned can be found in the image\n5. Image is the output of the corresponding steps",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        );
      },
    );
  }
}
