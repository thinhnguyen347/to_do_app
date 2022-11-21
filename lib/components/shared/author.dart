import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showAuthorDialog(BuildContext context) =>
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: const Text("App info"),
            content: Column(
              children: const [
                Text("Author: Thinh Nguyen"),
                Text("Contact: nd.thinh91@gmail.com"),
              ],
            ),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Close'),
              ),
            ],
          );
        });
