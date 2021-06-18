import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_app/presentation/main/main_model.dart';
import 'package:youtube_app/presentation/program_list/program_list_page.dart';
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
            title: Text(
              'Radipos',
              style: TextStyle(color: Colors.black54),
            ),
            backgroundColor: Colors.amberAccent,
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
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                      );
                    },
                  ),
                  RaisedButton(
                    child: Text('番組一覧'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProgramListPage()),
                      );
                    },
                  )
                ],
              ),
            );
          }),
          bottomNavigationBar: Builder(builder: (context) {
            return BottomNavigationBar(
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'ホーム',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    label: 'さがす',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.assignment_ind_outlined),
                    label: 'マイページ',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.assignment_ind_outlined),
                    label: 'マイページ',
                  ),
                ],
                currentIndex: 0,
                fixedColor: Colors.white,
                backgroundColor: Colors.amberAccent,
                showUnselectedLabels: true,
                type: BottomNavigationBarType.fixed,
                onTap: (int id) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProgramListPage()),
                  );
                });
          }),
        ),
      ),
    );
  }
}
