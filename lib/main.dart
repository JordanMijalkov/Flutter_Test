import 'package:book_library/viewModel/books_list_view_model.dart';
import 'package:book_library/views/bookListPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Flutter Interview",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: ChangeNotifierProvider(
          create: (context) => BooksListViewModel(),
          child: BookListPage(),
        ));
  }
}
