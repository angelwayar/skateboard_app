import 'package:flutter/material.dart';

class OffsetNotifier with ChangeNotifier {
  double _page = 0;

  double get page => _page;

  OffsetNotifier(PageController pageController) {
    pageController.addListener(() {
      _page = pageController.page!;
      notifyListeners();
    });
  }
}
