import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preference_ui_sample/view/home_screen/home_screen.dart';
import 'package:shared_preference_ui_sample/view/login_screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3),() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
     // Try reading data from the 'repeat' key. If it doesn't exist, returns null.
     bool loggedIn = prefs.getBool('loggedIn') ?? false;
     if(loggedIn){
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
     }else{
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
     }
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Center(
        child: Text("Splash screen",style: TextStyle(fontSize: 30),),
        ),
    );
  }
}