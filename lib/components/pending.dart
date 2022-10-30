import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:lottie/lottie.dart';

Widget pendingTask() {
  return Container(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Colors.black26,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadiusDirectional.circular(8)),
            child: Row(children: [
              Image.asset("assets/images/pending.png", width: 20),
              const SizedBox(width: 12),
              const Text("Pending tasks",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500))
            ]),
          ),
          const SizedBox(height: 16),
          // Expanded(
          //   flex: 1,
          //   child: Center(
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         SizedBox(
          //           width: 150,
          //           height: 150,
          //           child: Lottie.asset(
          //             'assets/lottie/105599-moody-dog.json',
          //             width: 130,
          //             fit: BoxFit.fill,
          //           ),
          //         ),
          //         Container(
          //             padding: const EdgeInsets.all(16),
          //             decoration: BoxDecoration(
          //                 color: Colors.white54,
          //                 shape: BoxShape.rectangle,
          //                 borderRadius: BorderRadiusDirectional.circular(8)),
          //             child: const Text('No pending task!',
          //                 style: TextStyle(fontSize: 18, color: Colors.black87)))
          //       ],
          //     ),
          //   ),
          // ),
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
                ),
                SlidableAction(
                  onPressed: (BuildContext context) {},
                  backgroundColor: const Color(0xFF0392CF),
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
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
