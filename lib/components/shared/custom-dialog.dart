import 'package:flutter/material.dart';

class DialogPopup extends StatelessWidget {
  const DialogPopup({Key? key, required this.controller}) : super(key: key);
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
            height: 250,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Text('Add a new task',
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
                const SizedBox(height: 16),
                Expanded(
                  child: TextField(
                    controller: controller,
                    maxLines: 4,
                    minLines: 4,
                    autofocus: true,
                  ),
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
                          textStyle: const TextStyle(color: Colors.white, fontSize: 18)),
                      child: const Text('Cancel'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(100, 40),
                          backgroundColor: Colors.green,
                          textStyle: const TextStyle(color: Colors.white, fontSize: 18)),
                      child: const Text('Add'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                )
              ],
            )));
  }
}
