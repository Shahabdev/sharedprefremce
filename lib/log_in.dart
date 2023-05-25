import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Home_screen.dart';
import 'main.dart';
class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                  hintText: 'name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black, width: 30))),
            ),
          ),
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
                hintText: 'e-mail',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black, width: 30))),
          ),
          ElevatedButton(
            onPressed: () async {
              SharedPreferences pref = await SharedPreferences.getInstance();
              pref.setString('name', nameController.text.toString());
              pref.setString('email', emailController.text.toString());
              pref.setBool('Login', true);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => MyHomePage()));
            },
            child: Text('LOG IN'),
          )
        ],
      ),
    );
  }
}