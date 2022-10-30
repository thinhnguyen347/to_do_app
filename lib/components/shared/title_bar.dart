import 'package:flutter/material.dart';

Widget titleBar(int screenCode){
  String iconUrl = screenCode == 0 ? "assets/images/pending.png" : "assets/images/pending.png";
  String title = screenCode == 0 ? "Pending tasks" : "Completed tasks";

  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
        color: Colors.black26,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadiusDirectional.circular(8)),
    child: Row(children: [
      Image.asset(iconUrl, width: 20),
      const SizedBox(width: 12),
      Text(title,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500))
    ]),
  );
}