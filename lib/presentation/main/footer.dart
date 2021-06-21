import 'package:flutter/material.dart';
import 'package:youtube_app/presentation/program_list/program_list_page.dart';

class Footer extends StatefulWidget {
  const Footer();

  @override
  _Footer createState() => _Footer();
}

class _Footer extends State {
  @override
  Widget build(BuildContext context) {
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
  }
}
