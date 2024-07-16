import 'package:flutter/material.dart';
import 'Screens/firstScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "OpenSans",
        primaryColor: const Color(0xE6FDF9F9),
        hintColor: const Color(0xFF128C7E),
      ),
      home:const SpalshScreen()
    );
  }
}
