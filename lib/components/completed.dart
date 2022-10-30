import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget completedTask() {
  return Container(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Colors.black38,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadiusDirectional.circular(8)
              ),
            child: Row(children: [
              Image.asset("assets/images/pending.png", width: 20),
              const SizedBox(width: 12),
              const Text("Completed tasks",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500))
            ]),
          ),
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
                      'assets/lottie/basket-ball.json',
                      width: 130,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: Colors.white54,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadiusDirectional.circular(8)),
                      child: const Text('No completed task!',
                          style: TextStyle(fontSize: 18, color: Colors.black87)))
                ],
              ),
            ),
          ),
        ],
      ));
}
