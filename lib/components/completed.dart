import 'package:flutter/material.dart';
import 'no_task.dart';

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
          noTask(1),
        ],
      ));
}
