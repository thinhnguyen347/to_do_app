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
            Image.asset("assets/images/pending.png", width: 20),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: Lottie.asset(
                      'assets/lottie/105599-moody-dog.json',
                      width: 130,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadiusDirectional.circular(10)
                      ),
                      child: const Text('No pending task!',
                          style: TextStyle(color: Colors.white)))
                ],
              ),
            ),
          ),
        ],
      ));
}
