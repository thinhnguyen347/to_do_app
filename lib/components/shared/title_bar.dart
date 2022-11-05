import 'package:flutter/material.dart';

Widget titleBar(int screenCode) {
  String title = screenCode == 0 ? "Pending tasks" : "Completed tasks";

  return Container(
    padding: const EdgeInsets.all(16),
    margin: const EdgeInsets.only(right: 52),
    decoration: BoxDecoration(
        // color: Colors.black12,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadiusDirectional.circular(8)),
    child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(title,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w500,
              shadows: [
                Shadow(
                  offset: Offset(2.0, 2.0),
                  blurRadius: 5.0,
                  color: Colors.black45,
                ),
              ]))
    ]),
  );
}
