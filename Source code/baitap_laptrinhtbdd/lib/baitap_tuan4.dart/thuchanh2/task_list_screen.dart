import 'package:baitap_laptrinhtbdd/baitap_tuan4.dart/thuchanh2/api_service.dart';
import 'package:baitap_laptrinhtbdd/baitap_tuan4.dart/thuchanh2/bottom_navbar_custom.dart';
import 'package:baitap_laptrinhtbdd/baitap_tuan4.dart/thuchanh2/empty_task.dart';
import 'package:baitap_laptrinhtbdd/baitap_tuan4.dart/thuchanh2/task_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'task_model.dart'; // Import model bạn đã cung cấp
import 'task_detail_screen.dart'; // Import màn hình chi tiết nhiệm vụ

class TaskListScreen extends StatefulWidget {
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          'assets/images/uth_logo.png',
          width: 66,
          height: 66,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "SmartTasks",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.roboto().fontFamily,
                color: Colors.blue,
              ),
            ),
            Text("A simple and efficient to-do app",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: GoogleFonts.roboto().fontFamily,
                  color: Colors.blue,
                )),
          ],
        ),
        elevation: 0,
        shadowColor: Colors.transparent,
      ),
      body: FutureBuilder<List<Task>>(
        future: ApiService().fetchListData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return EmptyTaskScreen();
          }

          List<Task> tasks = snapshot.data!;
          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              Task task = tasks[index];
              return TaskCard(task: task);
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavbarCustom(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(), // Đảm bảo FAB luôn hình tròn
        onPressed: () {},
        child: Icon(
          Icons.add,
          size: 32,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Color _getTaskColor(String status) {
    switch (status) {
      case 'In Progress':
        return Colors.yellow.shade100;
      case 'Pending':
        return Colors.red.shade100;
      case 'Completed':
        return Colors.blue.shade100;
      default:
        return Colors.grey.shade200;
    }
  }
}
