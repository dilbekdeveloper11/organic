import 'package:flutter/widgets.dart';

class CheckBoxProvider extends ChangeNotifier {
  bool isChecked = false;

  void changedChecked() {
    isChecked = !isChecked;
    notifyListeners();
  }
}