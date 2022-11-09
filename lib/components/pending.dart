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
                      children: [
                        SlidableAction(
                          onPressed: (BuildContext context) {
                            displayEditDialog(
                                context, pendingTask[index], index);
                          },
                          backgroundColor: const Color(0xFF7BC043),
                          foregroundColor: Colors.white,
                          icon: Icons.edit,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8)),
                        ),
                        SlidableAction(
                          onPressed: (BuildContext context) {
                            context
                                .read<TasksProvider>()
                                .completePendingTask(index);
                          },
                          backgroundColor: const Color(0xFFFCAF2C),
                          foregroundColor: Colors.white,
                          icon: Icons.assignment_turned_in,
                        ),
                        SlidableAction(
                          onPressed: (BuildContext context) {
                            context
                                .read<TasksProvider>()
                                .deletePendingTask(index);
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

Future<void> displayEditDialog(
    BuildContext context, Map task, int index) async {
  final TextEditingController controller = TextEditingController();

  return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
                height: 200,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text('Edit a task',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20)),
                    const SizedBox(height: 16),
                    TextFormField(
                      initialValue: task['taskContent'],
                      onSaved: (value) {
                        if (value != null) {
                          context
                              .read<TasksProvider>()
                              .editPendingTask(index, value);
                        } else {}
                      },
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize: const Size(100, 40),
                              backgroundColor: Colors.red,
                              textStyle: const TextStyle(
                                  color: Colors.white, fontSize: 18)),
                          child: const Text('Cancel'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize: const Size(100, 40),
                              backgroundColor: Colors.green,
                              textStyle: const TextStyle(
                                  color: Colors.white, fontSize: 18)),
                          child: const Text('Update'),
                          onPressed: () {
                            context
                                .read<TasksProvider>()
                                .addNewTask(controller.text);
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    )
                  ],
                )));
      });
}
