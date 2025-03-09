import 'package:baitap_laptrinhtbdd/baitap_tuan_1/baitap_tuan_1.dart';
import 'package:baitap_laptrinhtbdd/baitap_tuan_2/baitap_tuan_2.dart';
import 'package:baitap_laptrinhtbdd/baitap_tuan_2/thuchanh_1.dart';
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
      home: BaitapTuan2(),
    );
  }
}
