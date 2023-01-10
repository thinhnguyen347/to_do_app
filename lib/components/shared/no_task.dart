import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget noTask(int screenCode, String lang) {
  String url = 'assets/lottie/105599-moody-dog.json';

  return Center(
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
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.black54,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadiusDirectional.circular(8)),
            child: Text(
                lang == 'en' ? 'No task available!' : 'Không có dữ liệu!',
                style: const TextStyle(fontSize: 18, color: Colors.white)))
      ],
    ),
  );
}
