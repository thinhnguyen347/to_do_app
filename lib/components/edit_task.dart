import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:to_do_app/components/shared/dialog.dart';
import 'package:to_do_app/data/constants.dart' as constant;
import 'package:to_do_app/providers/background_provider.dart';
import 'package:to_do_app/providers/task_manage_provider.dart';

class EditTask extends StatefulWidget {
  const EditTask(
      {Key? key,
      required this.index,
      required this.oldContent,
      required this.oldExpDate})
      : super(key: key);

  final int index;
  final String oldContent;
  final String oldExpDate;

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  TextEditingController textFieldController = TextEditingController();
  TextEditingController dateFieldController = TextEditingController();

  static const bg = constant.wallpaper;
  late bool isModifyChecked;
  late bool isRemoveChecked;

  late bool isEmptyTask;
  late bool isEmptyDate;

  @override
  void initState() {
    isEmptyTask = false;
    isEmptyDate = false;
    isRemoveChecked = false;
    dateFieldController.text = widget.oldExpDate;
    textFieldController.text = widget.oldContent;
    if (widget.oldExpDate.isNotEmpty) {
      isModifyChecked = true;
    } else {
      isModifyChecked = false;
    }
    super.initState();
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
            title: const Text('Edit a task'),
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
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                          gapPadding: 4.0,
                        )),
                    onChanged: (value) {
                      if (value.isEmpty) {
                        isEmptyTask = true;
                      } else {
                        isEmptyTask = false;
                      }
                    },
                  ),
                  const SizedBox(height: 16),
                  widget.oldExpDate.isNotEmpty ? Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        value: isRemoveChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isRemoveChecked = value!;

                            if (isRemoveChecked) {
                              isModifyChecked = false;
                              dateFieldController.text = '';
                            }
                          });
                        },
                      ),
                      const SizedBox(width: 12),
                      const Text('Remove expiration date',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400))
                    ],
                  ) : const SizedBox(height: 0),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        value: isModifyChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isModifyChecked = value!;
                            if (isModifyChecked) {
                              isRemoveChecked = false;
                            }
                          });
                        },
                      ),
                      const SizedBox(width: 12),
                      const Text('Modify expiration date',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400))
                    ],
                  ),
                  const SizedBox(height: 10),
                  isModifyChecked
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
                      : const SizedBox(height: 10),
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
                            backgroundColor: textFieldController.text.isEmpty
                                ? Colors.grey
                                : Colors.green,
                            textStyle: const TextStyle(
                                color: Colors.white, fontSize: 18)),
                        child: const Text('Update'),
                        onPressed: () {
                          if (textFieldController.text.isNotEmpty) {
                            context.read<TasksProvider>().editPendingTask(
                                widget.index,
                                textFieldController.text,
                                dateFieldController.text);
                            Navigator.pop(context);
                          } else {
                            showInfoDialog(
                                context, 'Please fill in task content!', true);
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
