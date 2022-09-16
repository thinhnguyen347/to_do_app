import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget completedTask() {
  return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Image.asset("images/pending.png", width: 20),
            const SizedBox(width: 12),
            const Text("Completed tasks",
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
                'lottie/117326-cat-playing-animation.json',
                width: 300,
                height: 300,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ));
}
