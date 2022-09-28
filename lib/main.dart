import 'package:flutter/material.dart';
import 'package:journal_app_firebase/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
    ),
    home: HomeScreen(),
  ));
}
