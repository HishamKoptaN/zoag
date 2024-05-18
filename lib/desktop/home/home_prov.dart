import 'package:flutter/material.dart';

class HomeProvDesktop extends ChangeNotifier {
  PageController _pageController = PageController();
  int _currentPage = 0;
  String deviceType = 'Unknown';

  PageController get pageController => _pageController;

  int get currentPage => _currentPage;

  set currentPage(int value) {
    _currentPage = value;
    notifyListeners();
  }

  showOrder() {
    _pageController.nextPage(
        duration: const Duration(milliseconds: 1500), curve: Curves.ease);
  }

  void nextPage() {
    _pageController.nextPage(
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }

  void previousPage() {
    _pageController.previousPage(
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }
}
