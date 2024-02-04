import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/epub_provider.dart';
import 'screens/home_screen.dart';
import 'screens/navigation_bar.dart';
import 'screens/history_screen.dart';
import 'screens/flashcards_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => EpubProvider()),
      ],
      child: MaterialApp(
        title: 'Epub Reader',
        theme: ThemeData(
          primaryColor: Colors.indigo, // Azul escuro
          scaffoldBackgroundColor:
              Color.fromARGB(255, 94, 161, 212), // Cinza claro
        ),
        home: MyHomeScreen(),
        routes: {
          '/History': (context) => MyHistoryScreen(),
          '/Cards': (context) => MyCardsScreen(),
          '/Flashcards': (context) => MyFlashCardsScreen(),
        },
      ),
    );
  }
}
