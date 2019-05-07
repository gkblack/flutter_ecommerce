import 'package:flutter/material.dart';

// 首页Provide
class CurrentIndexProvide with ChangeNotifier{
  int currentIndex = 0;

  changeIndex(int newIndex){
    currentIndex = newIndex;
    notifyListeners();
  }
}