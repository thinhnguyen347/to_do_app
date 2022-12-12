import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/components/shared/alert_dialog.dart';
import 'package:to_do_app/components/shared/no_task.dart';
import 'package:to_do_app/providers/task_manage_provider.dart';

class PendingTasks extends StatelessWidget {
  final List<Map> pendingTasks;
  final String expImg = 'assets/lottie/1574-spa-flower-lineal-edited.json';

  const PendingTasks({Key? key, required this.pendingTasks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return pendingTasks.isEmpty
        ? noTask(0)
        : ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: pendingTasks.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                  padding: EdgeInsets.only(
                      bottom: index + 1 == pendingTasks.length ? 16 : 8,
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
                                context, pendingTasks[index], index);
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
                    child: Stack(children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          width: double.maxFinite,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: Colors.white70,
                              borderRadius:
                                  BorderRadiusDirectional.circular(8)),
                          child: Column(
                            children: [
                              Text(pendingTasks[index]['taskContent'],
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500)),
                            ],
                          )),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Lottie.asset(
                            expImg,
                            width: 40,
                            fit: BoxFit.fill,
                          ),
                        ),
                    ]),
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
                      onChanged: (value) {
                        controller.text = value;
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
                            if (controller.text.isNotEmpty) {
                              context
                                  .read<TasksProvider>()
                                  .editPendingTask(index, controller.text, '');
                              Navigator.pop(context);
                            } else {
                              Navigator.pop(context);
                              showInfoDialog(
                                  context,
                                  'Update could not be processed due to your empty input',
                                  true);
                            }
                          },
                        )
                      ],
                    )
                  ],
                )));
      });
}
