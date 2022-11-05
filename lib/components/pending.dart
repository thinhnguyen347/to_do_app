import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'shared/no_task.dart';

Widget pendingTask() {
  return Container(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 52),
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
                  icon: Icons.edit,
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
                ),
                SlidableAction(
                  onPressed: (BuildContext context) {},
                  backgroundColor: const Color(0xFFFCAF2C),
                  foregroundColor: Colors.white,
                  icon: Icons.assignment_turned_in,
                  ),
                SlidableAction(
                  onPressed: (BuildContext context) {},
                  backgroundColor: const Color(0xFFD63420),
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  borderRadius: const BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
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
