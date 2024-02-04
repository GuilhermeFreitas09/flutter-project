import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/epub_provider.dart';
import 'card_words_screen.dart';
import 'flashcards_screen.dart';
import '../src/chapter_selecion.dart';

class MyCardsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var epubProvider = context.watch<EpubProvider>();

    return Scaffold(
      body: BottomNavigationState(epubProvider: epubProvider),
      floatingActionButton: ChapterSelection(epubProvider: epubProvider),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class BottomNavigationState extends StatelessWidget {
  const BottomNavigationState({
    Key? key,
    required this.epubProvider,
  }) : super(key: key);

  final EpubProvider epubProvider;

  void _onItemTapped(int index) {
    epubProvider.updateAppbar(index);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetOptions = <Widget>[
      ChapterWords(selectedChapter: epubProvider.selectedChapter),
      MyFlashCardsScreen(),
    ];

    return Scaffold(
      appBar: AppBar(title: Text(epubProvider.bookContent['title'])),
      body: Center(
        child: widgetOptions.elementAt(epubProvider.selectedAppBar),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.translate),
            label: 'Palavras',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flash_on),
            label: 'Flashcards',
          ),
        ],
        currentIndex: epubProvider.selectedAppBar,
        onTap: _onItemTapped,
      ),
    );
  }
}



/*
class MyCardsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var epubProvider = context.watch<EpubProvider>();

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ChapterWords(selectedChapter: epubProvider.selectedChapter),
          ],
        ),
      ),
      bottomNavigationBar: screenContent(epubProvider, context),
    );
  }

  BottomNavigationBar screenContent(
      EpubProvider epubProvider, BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.translate),
          label: 'Palavras',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.flash_on),
          label: 'Flashcards',
        ),
      ],
      onTap: (index) {
        if (index == 0) {
        } else if (index == 1) {
          Navigator.pushNamed(context, '/Flashcards');
        }
      },
    );
  }
}
*/

/*
class MyFlashCardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var epubProvider = context.watch<EpubProvider>();

    return Scaffold(
      appBar: AppBar(),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ChapterWords(selectedChapter: epubProvider.selectedChapter),
          ],
        ),
      ),

      floatingActionButton: screenContent(epubProvider, context),
      //bottomNavigationBar: screenContent(epubProvider, context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Row screenContent(EpubProvider epubProvider, BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      ChapterSelection(epubProvider: epubProvider),
      SizedBox(width: 16),
      //EpubSelection(epubProvider: epubProvider),
      //SizedBox(width: 16),
      ElevatedButton(
        onPressed: () {
          // Navegar para a aba "Flashcard"
          //Navigator.pushNamed(context, '/Flashcard');
        },
        child: Text('Flashcard'),
      ),
    ]);
  }
}
*/
