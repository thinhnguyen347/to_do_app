import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:to_do_app/components/shared/title_bar.dart';
import 'shared/no_task.dart';

Widget pendingTask() {
  return Container(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleBar(0),
          const SizedBox(height: 16),
          // noTask(0),
          Slidable(
            key: const ValueKey(0),
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              dismissible: DismissiblePane(onDismissed: () {}),
              children: [
                SlidableAction(
                  onPressed: (BuildContext context) {},
                  backgroundColor: const Color(0xFF7BC043),
                  foregroundColor: Colors.white,
                  icon: Icons.archive,
                  label: 'Complete',
                  borderRadius: BorderRadius.circular(8),
                ),
                SlidableAction(
                  onPressed: (BuildContext context) {},
                  backgroundColor: const Color(0xFF0392CF),
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                  borderRadius: BorderRadius.circular(8),
                ),
              ],
            ),
            child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadiusDirectional.circular(8)),
                child: const Text("Pending tasks",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500))),
          ),
        ],
      ));
}
