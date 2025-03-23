import 'package:baitap_laptrinhtbdd/baitap_tuan4.dart/thuchanh1/root_screen.dart';
import 'package:baitap_laptrinhtbdd/baitap_tuan4.dart/thuchanh2/task_list_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {  
    return MaterialApp(
      title: 'Bài tập lập trình thiết bị di động',
      debugShowCheckedModeBanner: false,
      home: TaskListScreen(),
    );
  }
}
