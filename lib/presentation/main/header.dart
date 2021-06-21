import 'package:flutter/material.dart';

class Header extends StatelessWidget with PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Radipos',
        style: TextStyle(color: Colors.black54),
      ),
      backgroundColor: Colors.amberAccent,
    );
  }
}
