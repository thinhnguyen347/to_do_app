import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:to_do_app/components/shared/dialog.dart';
import 'package:to_do_app/data/constants.dart' as constant;
import 'package:to_do_app/providers/background_provider.dart';
import 'package:to_do_app/providers/language_provider.dart';
import 'package:to_do_app/providers/task_manage_provider.dart';

class AddNewTask extends StatefulWidget {
  const AddNewTask({super.key});

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

  onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is DateTime) {
        String formattedDate = DateFormat('dd-MM-yyyy').format(args.value);
        dateFieldController.text = formattedDate;
      }
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final lang = context.watch<LanguageProvider>().currentLanguage;

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            title: Text(lang == 'en' ? 'Add task' : 'Thêm công việc'),
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
                    children: [
                      const Icon(Icons.edit,
                          size: 24, color: Colors.lightGreenAccent),
                      const SizedBox(width: 10),
                      Text(
                        lang == 'en' ? 'Task content:' : 'Nội dung công việc:',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset.zero,
                              blurRadius: 10.0,
                              color: Colors.white,
                            )
                          ],
                        ),
                      )
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
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        gapPadding: 4.0,
                      ),
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
                      const SizedBox(width: 8),
                      Text(
                          lang == 'en'
                              ? 'Add expiration date'
                              : 'Thêm ngày hết hạn',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset.zero,
                                blurRadius: 10.0,
                                color: Colors.white,
                              )
                            ],
                          ))
                    ],
                  ),
                  const SizedBox(height: 10),
                  isChecked
                      ? TextField(
                          controller: dateFieldController,
                          keyboardType: TextInputType.datetime,
                          readOnly: true,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16.0)),
                              gapPadding: 4.0,
                            ),
                          ),
                          onChanged: (value) {
                            if (value.isEmpty) {
                              isEmptyDate = true;
                            } else {
                              isEmptyDate = false;
                            }
                          },
                          onTap: () => showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SfDateRangePicker(
                                        onSelectionChanged: onSelectionChanged,
                                        enablePastDates: false,
                                        selectionMode:
                                            DateRangePickerSelectionMode.single,
                                        initialDisplayDate: DateTime.now(),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        )
                      : const SizedBox(height: 20),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(120, 40),
                            backgroundColor: Colors.red,
                            textStyle: const TextStyle(
                                color: Colors.white, fontSize: 18)),
                        child: Text(lang == 'en' ? 'Cancel' : 'Huỷ bỏ'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(120, 40),
                            backgroundColor: Colors.green,
                            textStyle: const TextStyle(
                                color: Colors.white, fontSize: 18)),
                        child: Text(lang == 'en' ? 'Add' : 'Thêm mới'),
                        onPressed: () {
                          if (textFieldController.text.isNotEmpty) {
                            context.read<TasksProvider>().addNewTask(
                                textFieldController.text,
                                dateFieldController.text);
                            Navigator.pop(context);
                          } else {
                            showInfoDialog(
                                context,
                                lang == 'en'
                                    ? 'Please fill in task content!'
                                    : 'Vui lòng điền nội dung công việc!',
                                true);
                          }
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
