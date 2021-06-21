import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_app/domain/book.dart';
import 'package:youtube_app/presentation/main/footer.dart';
import 'package:youtube_app/presentation/main/header.dart';
import 'package:youtube_app/presentation/program_list/program_list_model.dart';

class ProgramListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProgramListModel>(
      create: (_) => ProgramListModel()..fetchBooks(),
      child: Scaffold(
        appBar: Header(),
        body: Consumer<ProgramListModel>(
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
        bottomNavigationBar: Footer(),
      ),
    );
  }

  Future deleteBook(
      BuildContext context, ProgramListModel model, Book book) async {
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
