import 'package:flutter/material.dart';
import '../src/epub_selection.dart';
import 'package:provider/provider.dart';
import '../../providers/epub_provider.dart';

class MyHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lang Helper'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlashCard(),
            SizedBox(height: 16),
            HistoryFiles(),
          ],
        ),
      ),
    );
  }
}

class FlashCard extends StatelessWidget {
  const FlashCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var epubProvider = context.watch<EpubProvider>();
    return ElevatedButton(
      onPressed: () async {
        await selectFile(epubProvider);
        // ignore: use_build_context_synchronously
        Navigator.pushNamed(context, '/Cards');
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        'Novo Livro',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

class HistoryFiles extends StatelessWidget {
  const HistoryFiles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/History');
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        'Histórico',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
