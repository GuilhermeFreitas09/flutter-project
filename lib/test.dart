import 'dart:io';
import 'dart:convert';

List<String> returnAllWords(Map<String, dynamic> epubMap) {
  List<String> allWords = [];

  Map<String, dynamic> chapters =
      Map<String, dynamic>.from(epubMap['chapters']);

  chapters.forEach((chapterTitle, words) {
    if (words is List) {
      allWords.addAll(words.cast<String>());
    }
  });

  return allWords;
}

List<String> returnChapterWords(
    Map<String, dynamic> epubMap, String chapterTitle) {
  List<String> chapterWords = [];

  Map<String, dynamic> chapters =
      Map<String, dynamic>.from(epubMap['chapters']);

  if (chapters.containsKey(chapterTitle)) {
    chapterWords = chapters[chapterTitle]?.cast<String>().toList() ?? [];
  }

  return chapterWords;
}

void main() async {
  File selectedFile = File('tests/input1.json');
  String selectedEpubJson = await selectedFile.readAsString();

  Map<String, dynamic> epubMap = json.decode(selectedEpubJson);

  print('Todas as palavras: ${returnAllWords(epubMap)}');

  String desiredChapter = 'chapter2';
  print(
      'Palavras do capítulo $desiredChapter: ${returnChapterWords(epubMap, desiredChapter)}');
}
