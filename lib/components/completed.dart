import 'package:flutter/material.dart';
import 'shared/no_task.dart';

Widget completedTask() {
  return Container(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 52),
          noTask(1),
        ],
      ));
}
