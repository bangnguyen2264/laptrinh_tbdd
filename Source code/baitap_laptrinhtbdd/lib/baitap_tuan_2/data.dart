import 'package:baitap_laptrinhtbdd/baitap_tuan_2/model.dart';

final List<Book> mockBooks = List.generate(
    20,
    (index) => Book(
        title: "Sách ${index + 1}",
        author: "Tác giả ${String.fromCharCode(65 + (index % 5))}"));

final List<User> mockUsers = [
  User("Nguyễn Văn A"),
  User("Trần Thị B"),
  User("Lê Văn C"),
  User("Phạm Thị D"),
  User("Đỗ Văn E"),
];
