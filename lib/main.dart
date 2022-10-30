import 'package:flutter/material.dart';
import 'package:finance_app/screens/Home.dart';

import 'package:finance_app/controllers_binding.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';


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
    return GetMaterialApp(
      home: Home(),
      initialBinding: ControllerBindings(),
    );
  }
}
