import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showInfoDialog(BuildContext context, String message, bool isAlert) =>
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/attention.png", width: 54),
                const SizedBox(height: 20),
                Text(message,
                    style: const TextStyle(fontSize: 18),
                    textAlign: TextAlign.center),
              ],
            ),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Close',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          );
        });
