import 'package:book_library/common/services/service.dart';
import 'package:book_library/models/book.dart';
import 'package:book_library/viewModel/book_view_model.dart';
import 'package:flutter/material.dart';

class BooksListViewModel extends ChangeNotifier {
  List<BookViewModel> books = [];
  Future<void> fetchData() async {
    final results = await Webservice().fetchData();
    books = results.map((item) => BookViewModel(book: item)).toList();
    notifyListeners();
  }

  removeBook(BookViewModel book) {
    books.remove(book);
    notifyListeners();
  }

  editBook(String bookId, String name, String author) {
    books[books.indexWhere((element) => element.bookId == bookId)] =
        BookViewModel(
            book: Book(
      bookId: bookId,
      name: name,
      author: author,
      image: books[int.parse(bookId) - 1].image,
    ));
    notifyListeners();
  }

  addBook(String name, String author) {
    var bookId = DateTime.now().toString();
    books.add(BookViewModel(
        book: Book(
            bookId: bookId,
            name: name,
            author: author,
            image:
                "https://www.mswordcoverpages.com/wp-content/uploads/2018/10/Book-cover-page-5-CRC.png")));
    notifyListeners();
  }
}
