import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showInfoDialog(BuildContext context, String message, bool isAlert) =>
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
              title: isAlert
                  ? const Icon(Icons.dangerous,
                      color: Colors.deepOrange, size: 40)
                  : const Icon(Icons.check_circle,
                      color: Colors.lightGreenAccent, size: 40),
              content: Text(message),
              actions: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(100, 40),
                      backgroundColor: Colors.red,
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 18)),
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ]);
        });
