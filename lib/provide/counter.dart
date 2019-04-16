import 'package:flutter/material.dart';

// provide 示例
class Counter with ChangeNotifier{
  int value =0;

  increment(){
    value++;
    notifyListeners();
  }
}