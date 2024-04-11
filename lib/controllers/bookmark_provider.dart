import 'package:flutter/foundation.dart';

class BookMarkProvider with ChangeNotifier {
  bool _isBookmark = true;

  bool get isBookmark => _isBookmark;

  set isBookmark(bool newState) {
    _isBookmark = newState;
    notifyListeners();
  }
}
