import 'package:finance_app/screens/ExpencesPage.dart';
import 'package:finance_app/screens/NewSavingPage.dart';
import 'package:finance_app/screens/SavingPage.dart';
import 'package:flutter/material.dart';
import 'package:finance_app/screens/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExpensesPage(),
    );
  }
}
