
import 'package:flutter/material.dart';

class CounterModel extends ChangeNotifier{
  int _counter = 0;
  get getCounter => _counter;
  set setCounter(int count) => _counter = count;

  void increament(){
    _counter+=1;
    notifyListeners();
  }

  void decreament(){
    _counter-=1;
    notifyListeners();
  }
}