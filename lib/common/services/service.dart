import 'package:book_library/models/book.dart';

class Webservice {
  Future<List<Book>> fetchData() async {
    final Iterable json = [
      {
        "bookId": '1',
        "name": 'THE BOOK TITLE HERE',
        "author": 'Jordan Parker',
        "image":
            'https://www.mswordcoverpages.com/wp-content/uploads/2018/10/Book-cover-page-5-CRC.png',
      },
      {
        "bookId": '2',
        "name": 'BOOK TITLE GOES HERE',
        "author": 'Andy Wang',
        "image":
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQRLOUidVHR_9qH2xUonksSs6gumAtCRe3GBOWbs3mlGaneUe1vjgy1zDNazWcAD2uvTo&usqp=CAU',
      },
      {
        "bookId": '3',
        "name": 'BOOK TITLE LOREM IPSUM',
        "author": 'Jessica Alba',
        "image":
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyq5tbO6U9z1FjYkgd9qu05NFz9x2QWdGBpRGbKSnqH1bHZe1L0m966UA-YZrZKuKolJI&usqp=CAU',
      },
      {
        "bookId": '4',
        "name": 'BOOK TITLE 4',
        "author": 'Michael Johnson',
        "image":
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSzauCCEfe3-4EpBxpl_3hdQYyLw_8F9L1T865evWjVOnXh5V7uXdjocqPJWcdcwI2A-o&usqp=CAU',
      },
      {
        "bookId": '5',
        "name": 'Book Title',
        "author": 'Angella Kedy',
        "image":
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkbEjBiU5oZ92vv0jXpekYnrLgkD81SF5Bloxo2uLEHsn66uYJbhwsThdQDjAbEHvh__E&usqp=CAU',
      },
      {
        "bookId": '6',
        "name": '2020',
        "author": 'Tiffany Johnson',
        "image":
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQn0ZIOBwTFp3oRY1696fFctj2zXC3UUGkR2P2r2X-MpEztILLNOiPutp1PS8i1ZNfLa7s&usqp=CAU',
      },
      {
        "bookId": '7',
        "name": 'War',
        "author": 'Monica Luwinsky',
        "image":
            'https://www.mswordcoverpages.com/wp-content/uploads/2018/10/Book-cover-page-3-CRC.png',
      }
    ];

    return json.map((book) => Book.fromJson(book)).toList();
  }
}
