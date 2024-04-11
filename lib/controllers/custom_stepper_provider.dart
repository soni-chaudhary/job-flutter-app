import 'package:flutter/material.dart';

class CustomStepperProvider extends ChangeNotifier {
  int _currentIndex=0;

  int get currentIndex=>_currentIndex;

  set currentIndex(int newIndex){
    _currentIndex=newIndex;
    notifyListeners();
  }

}