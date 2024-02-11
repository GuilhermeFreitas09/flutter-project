import 'package:flutter/material.dart';
import '../utils/epub_selection.dart';
import 'package:provider/provider.dart';
import '../../providers/epub_provider.dart';
import 'navigation_bar.dart';
import 'history_screen.dart';
import 'config_screen.dart';

class MyHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lang Helper'),
        centerTitle: true,
        actions: [
          configWidget(context),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlashCard(),
            SizedBox(height: 20),
            HistoryFiles(),
          ],
        ),
      ),
    );
  }

  IconButton configWidget(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.settings),
      onPressed: () {
        // Navegar para a tela de configurações
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyConfigScreen()),
        );
      },
    );
  }
}

class FlashCard extends StatelessWidget {
  const FlashCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var epubProvider = context.watch<EpubProvider>();
    return ElevatedButton(
      onPressed: () async {
        await selectFile(epubProvider);

        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          _createRouteCards(),
        );
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

PageRouteBuilder _createRouteCards() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => MyCardsScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class HistoryFiles extends StatelessWidget {
  const HistoryFiles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          _createRouteHistory(),
        );
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

PageRouteBuilder _createRouteHistory() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => MyHistoryScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
