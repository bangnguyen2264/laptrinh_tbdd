import 'package:baitap_laptrinhtbdd/baitap_tuan_2/data.dart';
import 'package:baitap_laptrinhtbdd/baitap_tuan_2/model.dart';
import 'package:flutter/material.dart';

class BaitapTuan2 extends StatefulWidget {
  const BaitapTuan2({super.key});

  @override
  State<BaitapTuan2> createState() => _BaitapTuan2State();
}

class _BaitapTuan2State extends State<BaitapTuan2> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) => setState(() => _selectedIndex = index);

  final List<Widget> _screens = [
    const ManagementScreen(),
    const BorrowedBooksScreen(),
    const UserScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hệ thống\nQuản lý Thư viện',
          style: TextStyle(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Quản lý'),
        BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Sách mượn'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Người dùng'),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.blue,
      onTap: _onItemTapped,
    );
  }
}

class ManagementScreen extends StatefulWidget {
  const ManagementScreen({super.key});

  @override
  State<ManagementScreen> createState() => _ManagementScreenState();
}

class _ManagementScreenState extends State<ManagementScreen> {
  final TextEditingController _employeeController = TextEditingController();
  final List<Book> books = mockBooks;
  final List<User> users = mockUsers;

  @override
  void initState() {
    super.initState();
    _employeeController.text = users.first.name;
  }

  void _changeEmployee(String value) {
    if (users.any((user) => user.name == value)) {
      setState(() {
        _employeeController.text = value;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("Nhân viên không tồn tại trong danh sách.")),
      );
    }
  }

  void _toggleBookSelection(int index) => setState(() {
        books[index].isBorrowed = !books[index].isBorrowed;
      });

  void _addBooks() {
    final selectedBooks = books
        .where((book) => book.isBorrowed)
        .map((book) => book.title)
        .toList();
    if (selectedBooks.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Đã thêm: ${selectedBooks.join(", ")}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle("Nhân viên"),
          Row(
            spacing: 10,
            children: [
              Expanded(
                child: TextField(
                  controller: _employeeController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Nhập tên nhân viên",
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  backgroundColor: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                onPressed: () => _changeEmployee(_employeeController.text),
                child: const Text(
                  "Đổi",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildTitle("Danh sách sách"),
          Expanded(
            child: ListView.builder(
              itemCount: books.length,
              itemBuilder: (context, index) => Card(
                child: CheckboxListTile(
                  activeColor: Colors.red,
                  checkColor: Colors.white,
                  title: Text("${books[index].title} - ${books[index].author}"),
                  value: books[index].isBorrowed,
                  onChanged: (_) => _toggleBookSelection(index),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                backgroundColor: Colors.blue,
                padding:
                    const EdgeInsets.symmetric(horizontal: 64, vertical: 16),
              ),
              onPressed: _addBooks,
              child: const Text(
                "Thêm",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(String text) {
    return Text(text,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold));
  }
}

class BorrowedBooksScreen extends StatefulWidget {
  const BorrowedBooksScreen({super.key});

  @override
  State<BorrowedBooksScreen> createState() => _BorrowedBooksScreenState();
}

class _BorrowedBooksScreenState extends State<BorrowedBooksScreen> {
  List<Book> _getBorrowedBooks() {
    return mockBooks.where((book) => book.isBorrowed).toList();
  }

  void _returnBook(Book book) {
    setState(() {
      book.isBorrowed = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Đã trả sách ${book.title}")),
    );
  }

  @override
  Widget build(BuildContext context) {
    final borrowedBooks = _getBorrowedBooks();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Danh sách sách đã mượn",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Expanded(
            child: ListView.builder(
              itemCount: borrowedBooks.length,
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  title: Text(borrowedBooks[index].title),
                  subtitle: Text("Tác giả: ${borrowedBooks[index].author}"),
                  trailing: IconButton(
                    onPressed: () => _returnBook(borrowedBooks[index]),
                    icon: Icon(Icons.delete, color: Colors.red),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Danh sách người dùng",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Expanded(
            child: ListView.builder(
              itemCount: mockUsers.length,
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  title: Text(mockUsers[index].name),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
