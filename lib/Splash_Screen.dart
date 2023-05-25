import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sharedprefrence_cha9/Home_screen.dart';
import 'log_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);
  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    wheretoGo();
  }

  void wheretoGo()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    var isLogin = pref.getBool('Login');
    Timer(Duration(seconds: 5), () {
      if (isLogin != null) {
        if (isLogin) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const MyHomePage(),
              ),
          );
        }
        else{
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const login(),
            ),
          );
        }

      }
      else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const MyHomePage(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.blue,
        child: Icon(
          Icons.time_to_leave_outlined,
          size: 50,
        ),
      ),
    );
  }
}
