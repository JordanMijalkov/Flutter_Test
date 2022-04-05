import 'package:book_library/common/widgets/book_list.dart';
import 'package:book_library/viewModel/books_list_view_model.dart';
import 'package:book_library/views/bookDetailPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookListPage extends StatefulWidget {
  BookListPage({Key? key}) : super(key: key);

  @override
  _BookListPageState createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<BooksListViewModel>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<BooksListViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Books"),
        centerTitle: false,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Expanded(
                child: BookList(
              books: vm.books,
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BookDetailPage(vm: vm),
            ),
          );
        },
      ),
    );
  }
}
