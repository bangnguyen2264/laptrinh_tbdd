class Book {
  String title;
  String author;
  bool isBorrowed;

  Book({required this.title, required this.author, this.isBorrowed = false});

  void borrowBook() {
    if (!isBorrowed) {
      isBorrowed = true;
    }
  }
}

class Person {
  String name;
  Person(this.name);
}

class User extends Person {
  List<Book> borrowedBooks = [];
  User(super.name);

  void borrow(Book book) {
    if (!book.isBorrowed) {
      book.borrowBook();
      borrowedBooks.add(book);
    }
  }
}