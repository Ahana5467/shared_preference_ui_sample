import 'package:flutter/material.dart';
import 'package:shared_preference_ui_sample/view/home_screen/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(onPressed: () async {
            // Obtain shared preferences.
            final SharedPreferences prefs = await SharedPreferences.getInstance();
            // Save an boolean value to 'repeat' key.
            await prefs.setBool('loggedIn', true);

            Navigator.pushReplacement(
             context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          } , child: Center(child: Center(child: Text("Login"))))
    );
  }
}