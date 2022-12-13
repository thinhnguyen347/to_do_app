import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/data/constants.dart' as constant;
import 'package:to_do_app/providers/background_provider.dart';
import 'package:to_do_app/providers/task_manage_provider.dart';

class AddNewTask extends StatefulWidget {
  const AddNewTask({Key? key}) : super(key: key);

  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  TextEditingController textFieldController = TextEditingController();
  TextEditingController dateFieldController = TextEditingController();

  static const bg = constant.wallpaper;
  late bool isChecked;
  late bool isEmptyTask;
  late bool isEmptyDate;

  @override
  void initState() {
    isEmptyTask = false;
    isEmptyDate = false;
    isChecked = false;
    dateFieldController.text = '';
    textFieldController.text = '';
    super.initState();
  }

  @override
  void dispose() {
    textFieldController.dispose();
    dateFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            title: const Text('Add new task'),
            centerTitle: true,
            backgroundColor: Colors.black54,
          ),
        ),
        body: Stack(
          clipBehavior: Clip.none,
          alignment: AlignmentDirectional.topStart,
          fit: StackFit.expand,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(bg[context
                      .watch<BackgroundProvider>()
                      .currentBackgroundIndex]),
                  fit: BoxFit.cover,
                ),
              ),
              child: ClipRRect(
                // Clip it cleanly.
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(color: Colors.grey.withOpacity(0.1)),
                ),
              ),
            ),
            SafeArea(
                child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Icon(Icons.edit,
                          size: 24, color: Colors.lightGreenAccent),
                      SizedBox(width: 10),
                      Text('Task content:',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500))
                    ],
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: textFieldController,
                    keyboardType: TextInputType.text,
                    showCursor: true,
                    autofocus: true,
                    minLines: 5,
                    maxLines: 10,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      errorText: isEmptyTask ? 'Empty task!' : '',
                      errorStyle: const TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                          fontStyle: FontStyle.italic),
                    ),
                    onChanged: (value) {
                      if (value.isEmpty) {
                        isEmptyTask = true;
                      } else {
                        isEmptyTask = false;
                      }
                    },
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                      const SizedBox(width: 12),
                      const Text('Add expiration date',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400))
                    ],
                  ),
                  const SizedBox(height: 10),
                  isChecked
                      ? TextField(
                          controller: dateFieldController,
                          keyboardType: TextInputType.datetime,
                          readOnly: true,
                          decoration: const InputDecoration(
                            labelText: "Enter Date",
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          onChanged: (value) {
                            if (value.isEmpty) {
                              isEmptyDate = true;
                            } else {
                              isEmptyDate = false;
                            }
                          },
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2101));

                            if (pickedDate != null) {
                              String formattedDate =
                                  DateFormat('dd-MM-yyyy').format(pickedDate);

                              setState(() {
                                dateFieldController.text = formattedDate;
                              });
                            } else {
                              dateFieldController.text = '';
                            }
                          },
                        )
                      : const SizedBox(height: 20),
                  const SizedBox(height: 20),
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
                        child: const Text('Add'),
                        onPressed: () {
                          context.read<TasksProvider>().addNewTask(
                              textFieldController.text,
                              dateFieldController.text);
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  )
                ],
              ),
            )),
          ],
        ));
  }
}