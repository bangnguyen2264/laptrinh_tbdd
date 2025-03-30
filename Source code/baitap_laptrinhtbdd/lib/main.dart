import 'package:baitap_laptrinhtbdd/baitap_tuan_4/thuchanh1/root_screen.dart';
import 'package:baitap_laptrinhtbdd/baitap_tuan_4/thuchanh2/task_list_screen.dart';
import 'package:baitap_laptrinhtbdd/baitap_tuan_5/login_screen.dart';
import 'package:baitap_laptrinhtbdd/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {  
    return MaterialApp(
      title: 'Bài tập lập trình thiết bị di động',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
