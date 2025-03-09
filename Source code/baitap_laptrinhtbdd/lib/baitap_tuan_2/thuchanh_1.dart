import 'package:flutter/material.dart';

class Thuchanh1 extends StatefulWidget {
  const Thuchanh1({super.key});

  @override
  State<Thuchanh1> createState() => _Thuchanh1State();
}

class _Thuchanh1State extends State<Thuchanh1> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  bool _isSubmitted = false;
  String response = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Thực hành 1'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              _buildTextFIeld('Họ và Tên', _nameController),
              _buildTextFIeld('Tuổi', _ageController),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.all<Color>(Colors.purple),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    _isSubmitted = true;
                    response = _checkAge();
                  });
                },
                child: Text('Kiểm tra',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 20),
              if (_isSubmitted)
                Text(
                  response,
                  style: TextStyle(fontSize: 20),
                ),
            ],
          ),
        ));
  }

  Widget _buildTextFIeld(String label, TextEditingController controller) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: 300,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller, // Thêm dòng này để liên kết controller
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 10),
          labelText: label,
          border: InputBorder.none,
        ),
      ),
    );
  }

  String _checkAge() {
    final int age = int.tryParse(_ageController.text) ?? 0;
    if (age <= 0) return 'Vui lòng nhập tuổi hợp lệ';
    if (age < 18) return 'Bạn là thiếu niên';
    if (age < 30) return 'Bạn là thanh niên';
    if (age < 50) return 'Bạn là người trung niên';

    return 'Bạn là người già';
  }
}
