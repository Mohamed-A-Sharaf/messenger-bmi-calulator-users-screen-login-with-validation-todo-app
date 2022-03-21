// ignore_for_file: prefer_const_constructors
// import 'dart:async';
// import 'package:app/bmi_result_screen.dart';
import 'package:app/modules/archived_tasks/archived_tasks_screen.dart';
import 'package:app/modules/bmi/bmi_screen.dart';
import 'package:app/modules/counter/counter_screen.dart';
import 'package:app/modules/home/home_screen.dart';
import 'package:app/modules/messenger/messenger_screen.dart';
import 'package:app/modules/users/users_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
  // Widget a = MyApp();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MessengerScreen(),
    );
  }
}
