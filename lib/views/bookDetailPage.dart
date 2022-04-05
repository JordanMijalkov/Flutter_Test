import 'package:book_library/models/book.dart';
import 'package:book_library/viewModel/book_view_model.dart';
import 'package:book_library/viewModel/books_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common/services/Validator.dart';

class BookDetailPage extends StatefulWidget {
  final BookViewModel? book;
  final BooksListViewModel vm;

  BookDetailPage({Key? key, this.book, required this.vm}) : super(key: key);

  @override
  _BookDetailPageState createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
  final _titleInput = TextEditingController();
  final _authorInput = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isButtonActive = false;
  @override
  void initState() {
    super.initState();
    _titleInput.addListener(() {
      final isButtonActive = FieldValidator.checkButtonIsActive(
          _titleInput.text, _authorInput.text);
      setState(() {
        this.isButtonActive = isButtonActive;
      });
    });
    _authorInput.addListener(() {
      final isButtonActive = FieldValidator.checkButtonIsActive(
          _titleInput.text, _authorInput.text);
      setState(() {
        this.isButtonActive = isButtonActive;
      });
    });
    try {
      _titleInput.text = widget.book!.name;
      _authorInput.text = widget.book!.author;
    } catch (e) {
      _titleInput.text = "";
      _authorInput.text = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,
      appBar: AppBar(
        title: Text("Books"),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              widget.vm.removeBook(widget.book!);
              Navigator.pop(context);
            },
            icon: Icon(Icons.delete),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            titleInput(),
            authorInput(),
            SizedBox(
              height: 20,
            ),
            Text("There is no Image"),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                saveButton(widget.vm),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget titleInput() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Title',
      ),
      controller: _titleInput,
    );
  }

  Widget authorInput() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Author',
      ),
      controller: _authorInput,
    );
  }

  Widget saveButton(BooksListViewModel vm) {
    return ElevatedButton(
      onPressed: isButtonActive
          ? () {
              if (widget.book == null) {
                vm.addBook(
                  _titleInput.text,
                  _authorInput.text,
                );
              } else {
                vm.editBook(
                  widget.book!.bookId,
                  _titleInput.text,
                  _authorInput.text,
                );
              }
              Navigator.pop(context);
            }
          : null,
      child: Text("Save"),
    );
  }
}
