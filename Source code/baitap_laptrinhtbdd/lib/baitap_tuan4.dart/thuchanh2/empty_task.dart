import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFE6E6E6),
          borderRadius: BorderRadius.circular(10),
        ),
        width: 350,
        height: 255,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/empty.png',
              color: Colors.black,
            ),
            SizedBox(height: 10),
            Text("No Tasks Yet!",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text("Stay productive—add something to do"),
          ],
        ),
      ),
    );
  }
}
