import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/constants.dart';

void showAuthorDialog(BuildContext context) => showDialog(
    context: context,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: const Text("About app"),
        content: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 16,
            ),
            Text("Developer: Thinh Nguyen"),
            Text("Email: nd.thinh91@gmail.com"),
            // Text("Phone/ Zalo: 0984018891"),
            Text("***"),
            Text(
              "Version: $appVersion",
              textAlign: TextAlign.left,
            ),
            Text(
              "Icon sources: lottiefiles.com, freepik.com",
              textAlign: TextAlign.left,
            ),
            Text(
              "Photo sources: unsplash.com, wallpapers.com, pexel.com",
              textAlign: TextAlign.left,
            ),
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
