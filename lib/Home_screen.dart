import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedprefrence_cha9/log_in.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var Name = ' ';
  var e_mail = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loaddata();
  }

  void loaddata() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    Name = sp.getString('name') ?? '';
    e_mail = sp.getString('email') ?? '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Text(Name)),
            Text(e_mail),
            ElevatedButton(
                onPressed: () async {
                  SharedPreferences pre = await SharedPreferences.getInstance();
                  pre.setBool('Logout', false);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => login()));
                },
                child: Text('log out'))
          ],
        ));
  }
}
