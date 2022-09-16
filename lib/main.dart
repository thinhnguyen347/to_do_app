import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'To-do list'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [Color(0xFF787ff6), Color(0xFF4adede)],
              tileMode: TileMode.clamp,
              begin: Alignment(0.3, -1),
              end: Alignment(-0.8, 1),
            )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Image.asset("images/pending.png", width: 20),
                  const SizedBox(width: 12),
                  const Text("Pending tasks",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500))
                ]),
                const SizedBox(height: 16),
                Center(
                  child: Lottie.asset(
                    'lottie/119489-business-discussion.json',
                    width: 300,
                    height: 300,
                    fit: BoxFit.fill,
                  ),
                ),
                Row(children: [
                  Image.asset("images/completed.png", width: 20),
                  const SizedBox(width: 12),
                  const Text("Completed tasked",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500))
                ]),
                const SizedBox(height: 16)
              ],
            )) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
