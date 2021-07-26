import 'package:fello_project/screens/home_screen.dart';
import 'package:fello_project/utility/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primaryColor: colorPrimary,
        accentColor: colorAccent,
      ),
      home: const HomeScreen(),
      routes: {
        HomeScreen.id: (context) => const HomeScreen(),
      },
    );
  }
}
