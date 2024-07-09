import 'package:flutter/material.dart';
import 'Screens/HomeScreen.dart';
import 'Screens/loginScreen.dart';

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
        primaryColor: const Color(0xFF7B53FF),
        hintColor: const Color(0xFF128C7E),
      ),
      home:const LoginPage()
    );
  }
}
