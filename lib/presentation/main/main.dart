import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_app/presentation/book_list/book_list_page.dart';
import 'package:youtube_app/presentation/main/main_model.dart';
import 'package:youtube_app/signup/signup_page.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        home: ChangeNotifierProvider<MainModel>(
          create: (_) => MainModel(),
          child: Scaffold(
              appBar: AppBar(
                title: Text('デモ'),
              ),
              body: Consumer<MainModel>(builder: (context, model, child) {
                return Center(
                  child: Column(
                    children: [
                      Text(
                        model.displayText,
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                      RaisedButton(
                        child: Text('新規登録'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpPage()),
                          );
                        },
                      ),
                      RaisedButton(
                        child: Text('本一覧'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BookListPage()),
                          );
                        },
                      )
                    ],
                  ),
                );
              })),
        ));
  }
}
