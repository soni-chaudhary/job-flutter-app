import 'package:flutter/foundation.dart';

class ZoomProvider extends ChangeNotifier {
  int _currentIndex=0;

  int get currentIndex=>_currentIndex;

  set currentIndex(int newIndex){
    _currentIndex=newIndex;
    notifyListeners();
  }

}