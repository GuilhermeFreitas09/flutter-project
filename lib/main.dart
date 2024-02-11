import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/epub_provider.dart';
import 'screens/home_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'data/books.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookAdapter());
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
            primaryColor: Colors.indigo,
            scaffoldBackgroundColor: Color.fromARGB(255, 94, 161, 212),
          ),
          home: MyHomeScreen()),
    );
  }
}
