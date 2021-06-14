import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_app/domain/book.dart';
import 'package:youtube_app/presentation/add_book/add_book_page.dart';
import 'package:youtube_app/presentation/book_list/book_list_model.dart';

class BookListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BookListModel>(
      create: (_) => BookListModel()..fetchBooks(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('番組一覧'),
        ),
        body: Consumer<BookListModel>(
          builder: (context, model, child) {
            final books = model.books;
            final listTiles = books
                .map((book) => Card(
                        child: ListTile(
                      leading: Image.network(
                          'https://www.allnightnippon.com/wp/assets/uploads/2019/11/main_sanshiro02.jpg'),
                      title: Text('番組名'),
                      subtitle: Text('番組紹介文が入ります番組紹介文が入ります'),
                      isThreeLine: true,
                      trailing: IconButton(
                        icon: Icon(Icons.star_outline),
                        onPressed: () async {
                          // todo お気に入りに追加
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('番組をお気に入りに追加しました'),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text('OK'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  )
                                ],
                              );
                            },
                          );
                        },
                      ),
                    )))
                .toList();
            return ListView(
              children: listTiles,
            );
          },
        ),
        floatingActionButton:
            Consumer<BookListModel>(builder: (context, model, child) {
          return FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () async {
              await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddBookPage(),
                    fullscreenDialog: true,
                  ));
              model.fetchBooks();
            },
          );
        }),
      ),
    );
  }

  Future deleteBook(
      BuildContext context, BookListModel model, Book book) async {
    try {
      await model.deleteBook(book);
      await model.fetchBooks();
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(e.toString()),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        },
      );
    }
  }
}
