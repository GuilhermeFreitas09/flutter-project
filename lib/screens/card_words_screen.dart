import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/epub_provider.dart';

class ChapterWords extends StatelessWidget {
  final String selectedChapter;

  const ChapterWords({
    Key? key,
    required this.selectedChapter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var epubProvider = context.watch<EpubProvider>();

    double screenHeight = MediaQuery.of(context).size.height;
    JsonProcessor jsonProcessor = JsonProcessor(epubProvider.bookContent);

    List<String> allWords;
    if (selectedChapter == '') {
      //allWords = epubProvider.bookContent['chapters'].values.expand((lista) => lista.map((element) => element.toString())).toList();
      allWords = jsonProcessor.returnAllWords();
    } else {
      //allWords = (epubProvider.bookContent['chapters'][selectedChapter] as List<dynamic>?)?.map((element) => element.toString()).toList() ??[];
      allWords = jsonProcessor.returnChapterWords(selectedChapter);
    }

    if (epubProvider.isSelected) {
      return SizedBox(
        height: screenHeight * 0.8,
        child: ListView.builder(
          itemCount: allWords.length,
          itemBuilder: (context, index) {
            return WordTile(
              wordCard: allWords.isNotEmpty
                  ? allWords[index]
                  : 'Nenhuma palavra disponível',
              onTap: () => {},
              isSelected: false,
            );
          },
        ),
      );
    } else {
      return Text("Selecione um arquivo");
    }
  }
}

class WordTile extends StatelessWidget {
  final String wordCard;
  final bool isSelected;
  final VoidCallback onTap;

  WordTile({
    required this.wordCard,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: isSelected ? 10 : 5,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.transparent,
        child: ExpansionTile(
          title: Text(
            wordCard,
            style: TextStyle(
              color: const Color.fromARGB(255, 13, 13, 13),
            ),
          ),
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              child: Text(
                wordCard,
                style: TextStyle(color: const Color.fromARGB(255, 1, 1, 1)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class JsonProcessor {
  Map<String, dynamic> bookContent;

  JsonProcessor(this.bookContent);

  List<String> returnAllWords() {
    List<String> allWords = [];

    Map<String, dynamic> chapters =
        Map<String, dynamic>.from(bookContent['chapters']);

    chapters.forEach((chapterTitle, words) {
      if (words is List) {
        allWords.addAll(words.cast<String>());
      }
    });

    return allWords;
  }

  List<String> returnChapterWords(String chapterTitle) {
    List<String> chapterWords = [];

    Map<String, dynamic> chapters =
        Map<String, dynamic>.from(bookContent['chapters']);

    if (chapters.containsKey(chapterTitle)) {
      chapterWords = chapters[chapterTitle]?.cast<String>().toList() ?? [];
    }

    return chapterWords;
  }
}
