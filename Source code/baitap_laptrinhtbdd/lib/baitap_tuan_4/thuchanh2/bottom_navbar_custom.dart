import 'package:flutter/material.dart';

class BottomNavbarCustom extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavbarCustom({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(50)), // Bo tròn góc trên
        child: BottomNavigationBar(
          backgroundColor: Colors.white, // Màu nền của NavBar
          currentIndex: selectedIndex,
          onTap: onItemTapped,
          selectedItemColor: Colors.blue, // Màu của icon được chọn
          unselectedItemColor: Colors.black, // Màu của icon chưa được chọn
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 24),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_outlined, size: 24),
              label: "Calendar",
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/icons/doc.png', width: 24, height: 24),
              label: "Documents",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings, size: 24),
              label: "Settings",
            ),
          ],
        ),
      ),
    );
  }
}
