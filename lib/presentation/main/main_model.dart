import 'package:flutter/material.dart';

class MainModel extends ChangeNotifier {
  String displayText = 'でもテキスト';

  void changeDemoText() {
    displayText = 'デモテキスト！！';
    notifyListeners();
  }
}
