import 'package:flutter/material.dart';
import 'package:to_do_app/components/shared/title_bar.dart';
import 'shared/no_task.dart';

Widget completedTask() {
  return Container(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleBar(1),
          const SizedBox(height: 16),
          noTask(1),
        ],
      ));
}
