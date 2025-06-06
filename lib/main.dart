import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/components/home.dart';
import 'package:to_do_app/providers/active_tab_provider.dart';
import 'package:to_do_app/providers/background_provider.dart';
import 'package:to_do_app/providers/language_provider.dart';
import 'package:to_do_app/providers/task_manage_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => BackgroundProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => ActiveTabProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => TasksProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => LanguageProvider(),
          lazy: false,
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 800),
      child: MaterialApp(
        title: 'My To-Do App',
        theme: ThemeData(
          unselectedWidgetColor: Colors.blue.shade500,
        ),
        home: const FlashScreen(),
      ),
    );
  }
}

class FlashScreen extends StatefulWidget {
  const FlashScreen({super.key});

  @override
  State<FlashScreen> createState() => _FlashScreenState();
}

class _FlashScreenState extends State<FlashScreen> {
  late Timer timer;

  @override
  void initState() {
    timer = Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/15.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          // child: Center(child: Image.asset('assets/images/logo.png', width: 200,)
          // ),
        ),
        onDoubleTap: () {
          timer.cancel();
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const HomePage()));
        });
  }
}
