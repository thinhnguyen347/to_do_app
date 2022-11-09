import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/components/providers/task_manage_provider.dart';

import 'shared/no_task.dart';

class CompletedTasks extends StatelessWidget {
  const CompletedTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final completedTask = context.watch<TasksProvider>().completedTasks;

    return completedTask.isEmpty
        ? noTask(1)
        : ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: completedTask.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                  padding: EdgeInsets.only(
                      bottom: index + 1 == completedTask.length ? 16 : 8,
                      left: 16,
                      right: 16),
                  child: Slidable(
                    key: const ValueKey(0),
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (BuildContext context) {
                            context
                                .read<TasksProvider>()
                                .undoCompletedTask(index);
                          },
                          backgroundColor: const Color(0xFF7BC043),
                          foregroundColor: Colors.white,
                          icon: Icons.refresh,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8)),
                        ),
                        SlidableAction(
                          onPressed: (BuildContext context) {
                            context
                                .read<TasksProvider>()
                                .deleteCompletedTask(index);
                          },
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
                      alignment: Alignment.centerLeft,
                      width: double.maxFinite,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadiusDirectional.circular(8)),
                      child: Text(completedTask[index]['taskContent'],
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                    ),
                  ));
            });
  }
}
