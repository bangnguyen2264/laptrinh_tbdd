import 'package:baitap_laptrinhtbdd/baitap_tuan4.dart/thuchanh2/appbar_custom.dart';
import 'package:baitap_laptrinhtbdd/baitap_tuan4.dart/thuchanh2/task_model.dart';
import 'package:flutter/material.dart';

class TaskDetailScreen extends StatelessWidget {
  final Task task;

  TaskDetailScreen({required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarCustom(title: "Task Detail"),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(task.title,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(task.description),
            SizedBox(height: 10),
            _buildTaskInfo(),
            SizedBox(height: 10),
            Text("Subtasks",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ...task.subtasks.map((subtask) => Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFE6E6E6),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 4),
                  child: CheckboxListTile(
                    title: Text(subtask.title),
                    value: subtask.isCompleted,
                    onChanged: (value) {},
                    controlAffinity: ListTileControlAffinity
                        .leading, // Move checkbox to left
                  ),
                )),
            SizedBox(height: 10),
            Text("Attachments",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ...task.attachments.map((attachment) => ListTile(
                  leading: Icon(Icons.attach_file),
                  title: Text(attachment.fileName),
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskInfo() {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xFFE1BBC1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildTaskInforItem("assets/icons/category.png", "Category",
              task.category.toString()),
          _buildTaskInforItem(
              "assets/icons/status.png", "Status", task.status.toString()),
          _buildTaskInforItem("assets/icons/priority.png", "Priority",
              task.priority.toString()),
        ],
      ),
    );
  }

  Widget _buildTaskInforItem(String iconPath, String title, String value) {
    return Expanded(
      // Ensures this item expands within its parent Row
      child: Row(
        children: [
          Image.asset(iconPath, width: 20, height: 20),
          SizedBox(width: 5),
          Expanded(
            // Ensures text elements do not exceed available space
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title),
                Text(value, style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
