import 'package:flutter/material.dart';
import 'dart:convert';

class EpubProvider extends ChangeNotifier {
  Map<String, dynamic> _bookContent = {};
  Map<String, dynamic> get bookContent => _bookContent;

  bool _isSelected = false;
  bool get isSelected => _isSelected;

  String _selectedChapter = '';
  String get selectedChapter => _selectedChapter;

  int _selectedAppBar = 0;
  int get selectedAppBar => _selectedAppBar;

  Future<void> loadEpub(String epubJson) async {
    _bookContent = json.decode(epubJson);
    _selectedChapter = '';
    _isSelected = true;
    notifyListeners();
  }

  Future<void> loadChapter(String newSelectedChapter) async {
    _selectedChapter = newSelectedChapter;
    notifyListeners();
  }

  Future<void> updateAppbar(int newSelectedBar) async {
    _selectedAppBar = newSelectedBar;
    notifyListeners();
  }
}
