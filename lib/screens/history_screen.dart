import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MyHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Livros'),
      ),
    );
    */

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Livros'),
      ),
      body: BookListWidget(),
    );
  }
}

class BookListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    try {
      final myBox = Hive.box<Map<String, dynamic>>('bookBox');
      return ListView.builder(
        itemCount: myBox.length,
        itemBuilder: (context, index) {
          final item = myBox.getAt(index);
          return Text(item?['title']); //Cards(item: item);
        },
      );
    } catch (e) {
      return Text('Você ainda não adicionou nenhum livro.');
    }
  }
}

class Cards extends StatelessWidget {
  const Cards({
    super.key,
    required this.item,
  });

  final Map<String, dynamic>? item;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${item?['title']}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}



/*
class MyHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    teste();
    return Scaffold(
      appBar: AppBar(
        title: Text('Histórico'),
      ),
      //body: Text("Flashcard"),
    );
  }

  void teste() async {
    final bookBox = await Hive.openBox<Map<String, dynamic>>('bookBox');
    print(bookBox.get('Test 1'));
  }
}*/