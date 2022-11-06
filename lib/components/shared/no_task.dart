import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget noTask(int screenCode ){

  String url = screenCode == 0 ? 'assets/lottie/basket-ball.json' : 'assets/lottie/105599-moody-dog.json';
  String message = screenCode == 0 ? 'pending' : 'completed';

  return Expanded(
    flex: 1,
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 150,
            height: 150,
            child: Lottie.asset(
              url,
              width: 130,
              fit: BoxFit.fill,
            ),
          ),
          Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.white70,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadiusDirectional.circular(8)),
              child: Text('No $message task!',
                  style: const TextStyle(fontSize: 18, color: Colors.black87)))
        ],
      ),
    ),
  );
}