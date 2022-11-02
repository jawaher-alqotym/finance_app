import 'package:finance_app/screens/ExpencesPage.dart';
import 'package:finance_app/screens/NewSavingPage.dart';
import 'package:flutter/material.dart';
import 'package:finance_app/screens/Home.dart';
import 'package:finance_app/screens/add_new_expense_page.dart';
import 'package:finance_app/screens/insight_page.dart';
import 'package:finance_app/controllers_binding.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:finance_app/screens/onboarding_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  // for splash screen
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // For the splash screen, delayed 3 sec
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3))
        .then((value) => {FlutterNativeSplash.remove()});
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoardingPage(),
      initialBinding: ControllerBindings(),
    );
  }
}
