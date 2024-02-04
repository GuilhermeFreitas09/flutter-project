import 'package:flutter/material.dart';
import 'dart:convert';

class EpubProvider extends ChangeNotifier {
  Map<String, dynamic> _chapterContent = {};
  Map<String, dynamic> get chapterContent => _chapterContent;

  bool _isSelected = false;
  bool get isSelected => _isSelected;

  int _selectedIndex = 0;
  int get isSelectedIndex => _selectedIndex;

  String _selectedChapter = '';
  String get selectedChapter => _selectedChapter;

  int _selectedAppBar = 0;
  int get selectedAppBar => _selectedAppBar;

  Future<void> loadEpub(String epubJson) async {
    _chapterContent = json.decode(epubJson);
    _selectedChapter = '';
    _isSelected = true;
    notifyListeners();
  }

  Future<void> loadChapter(String newSelectedChapter) async {
    _selectedChapter = newSelectedChapter;
    notifyListeners();
  }

  Future<void> updateIndex(int newSelectedIndex) async {
    _selectedIndex = newSelectedIndex;
    notifyListeners();
  }

  Future<void> updateAppbar(int newSelectedBar) async {
    _selectedAppBar = newSelectedBar;
    notifyListeners();
  }
}
