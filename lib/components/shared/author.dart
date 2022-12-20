import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showAuthorDialog(BuildContext context) => showDialog(
    context: context,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: const Text("Application info"),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(
              height: 16,
            ),
            Text("Developer: Thinh Nguyen"),
            Text("Email contact: nd.thinh91@gmail.com"),
            Text("Phone/ Zalo: 0984018891"),
            Text("***"),
            Text("Icon sources: lottiefiles.com, freepik.com"),
            Text("Image sources: unsplash.com, wallpapers.com"),
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
