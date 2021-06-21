import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_app/presentation/main/main_model.dart';
import 'package:youtube_app/presentation/program_list/program_list_page.dart';

import 'footer.dart';
import 'header.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: Header(),
        body: Center(
          child: Column(
            children: [
              Text(
                'ホーム画面',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Footer(),
      ),
    );
  }
}
