import 'package:flutter/material.dart';

class Change extends ChangeNotifier {
  int like = 0;
  int comment = 0;
  bool visible = false;

  int get likeCounter {
    return like;
  }

  int get commentCounter {
    return comment;
  }

  bool get visibilityState {
    return visible;
  }


  void increaseLikeCounter() {
    like++;
    notifyListeners();
  }

  void increaseCommentCounter() {
    comment++;
    notifyListeners();
  }

  set visibilityState(bool status) {
    visible = status;
    notifyListeners();
  }
}
