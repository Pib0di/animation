import 'package:animation/presentation/creation_area/view/creation_page.dart';
import 'package:animation/presentation/home_page/view/home_page.dart';
import 'package:animation/presentation/side_menu/side_menu_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Timer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
