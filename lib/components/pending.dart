import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget pendingTask() {
  return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Image.asset("images/pending.png", width: 20),
            const SizedBox(width: 12),
            const Text("Pending tasks",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500))
          ]),
          const SizedBox(height: 16),
          Expanded(
            flex: 1,
            child: Center(
              child: Lottie.asset(
                'lottie/105599-moody-dog.json',
                width: 300,
                height: 300,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ));
}
