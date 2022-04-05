import 'package:book_library/models/book.dart';

class BookViewModel {
  Book book;
  BookViewModel({required this.book});
  String get bookId {
    return book.bookId;
  }

  String get name {
    return book.name!;
  }

  String get author {
    return book.author!;
  }

  String get image {
    return book.image!;
  }
}
