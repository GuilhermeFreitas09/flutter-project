import 'package:flutter/material.dart';
import '../../providers/epub_provider.dart';

class ChapterSelection extends StatelessWidget {
  const ChapterSelection({
    Key? key,
    required this.epubProvider,
  }) : super(key: key);

  final EpubProvider epubProvider;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        _showCapitulosDialog(context);
      },
      backgroundColor: Colors.indigo,
      child: Icon(Icons.book),
    );
  }

  void _showCapitulosDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return _buildCapitulosDialog(
          List<String>.from(epubProvider.bookContent['chapters'].keys),
          context, // Passando context para o método _buildCapituloItem
        );
      },
    );
  }

  Widget _buildCapitulosDialog(List<String> titulos, BuildContext context) {
    return AlertDialog(
      title: Text('Selecionar Capítulo'),
      content: SingleChildScrollView(
        child: Column(
          children: titulos
              .map((titulo) => _buildCapituloItem(titulo, context))
              .toList(),
        ),
      ),
    );
  }

  Widget _buildCapituloItem(String titulo, BuildContext context) {
    return ListTile(
      title: Text(titulo),
      onTap: () {
        _onCapituloSelected(titulo);
        Navigator.pop(context);
      },
    );
  }

  void _onCapituloSelected(String capitulo) async {
    await epubProvider.loadChapter(capitulo);
  }
}
