import 'package:flutter/material.dart';

Widget titleBar(int screenCode) {
  String title = screenCode == 0 ? "Pending tasks" : "Completed tasks";

  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
        // color: Colors.black26,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadiusDirectional.circular(8)),
    child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(title,
          style: const TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.w500))
    ]),
  );
}
