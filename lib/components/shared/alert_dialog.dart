import 'package:flutter/material.dart';

void showInfoDialog(BuildContext context, String message, bool isAlert) =>
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: isAlert
                  ? const Icon(Icons.dangerous,
                      color: Colors.deepOrange, size: 40)
                  : const Icon(Icons.check_circle,
                      color: Colors.lightGreenAccent, size: 40),
              content: Text(message, style: const TextStyle(fontSize: 16), textAlign: TextAlign.center),
              actionsAlignment: MainAxisAlignment.center,
              actions: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(80, 40),
                      textStyle:
                          const TextStyle(color: Colors.black87, fontSize: 18)),
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ]);
        });
