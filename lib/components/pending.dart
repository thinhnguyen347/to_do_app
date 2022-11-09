import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/components/providers/task_manage_provider.dart';

import 'shared/no_task.dart';

class PendingTasks extends StatelessWidget {
  const PendingTasks({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final pendingTask = context.watch<TasksProvider>().pendingTasks;

    return pendingTask.isEmpty
        ? noTask(0)
        : ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: pendingTask.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                  padding: EdgeInsets.only(
                      bottom: index + 1 == pendingTask.length ? 16 : 8,
                      left: 16,
                      right: 16),
                  child: Slidable(
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
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8)),
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
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(8),
                              bottomRight: Radius.circular(8)),
                        ),
                      ],
                    ),
                    child: Container(
                        width: double.maxFinite,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadiusDirectional.circular(8)),
                        child: Column(
                          children: [
                            Text(pendingTask[index]['taskContent'],
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500)),
                          ],
                        )),
                  ));
            },
          );
  }
}
