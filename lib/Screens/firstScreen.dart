import 'package:flutter/material.dart';
import 'package:chatapp/Screens/CreateAccount.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:chatapp/Screens/HomeScreen.dart';
import 'package:chatapp/Model/ChatModel.dart';


class SpalshScreen extends StatefulWidget {
  const SpalshScreen({Key? key}) : super(key: key);

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..forward();
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _checkLog();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _checkLog() async {
    final prefs = await SharedPreferences.getInstance();
    final ownerName = prefs.getString('ownerName');
    final ownerMobile = prefs.getString('ownerMobile');

    await Future.delayed(const Duration(seconds: 4), () {}); // Short delay for splash screen effect

    if (ownerName != null && ownerMobile != null) {
      ChatModel sourceChat =ChatModel(name: ownerName, id: int.parse(ownerMobile));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen(sourceChat: sourceChat)),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const CreateAccount()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.greenAccent, Colors.blueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Align(
          alignment: Alignment.center,
          child: FadeTransition(
            opacity: _animation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 3),
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/logo2.jpg',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "WhatsUP",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 45,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
