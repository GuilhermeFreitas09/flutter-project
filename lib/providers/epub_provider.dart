import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:hive/hive.dart';

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
    final bookBox = await Hive.openBox<Map<String, dynamic>>('bookBox');
    _bookContent = json.decode(epubJson);
    await bookBox.put(_bookContent['title'], _bookContent);
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
