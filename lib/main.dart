
import 'package:flutter/material.dart';
import 'package:finance_app/controllers_binding.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:finance_app/screens/onboarding_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async{
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,

  );
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);  // for splash screen
  runApp(MyApp());
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
      theme: ThemeData(
          splashColor: Color(0xff53D258),
          fontFamily: 'HacenDigital'),
      debugShowCheckedModeBanner: false,
      home: OnBoardingPage(),
      initialBinding: ControllerBindings(),
    );
  }
}
