import 'package:chatapp/Share/Components/constant.dart';
import 'package:chatapp/pages/SignUp_page.dart';
import 'package:chatapp/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch:Colors.purple,
      ),
      routes: {

        LoginScreen().id: (context) => LoginScreen(),
        SignUpScreen().id : (context) => SignUpScreen(),

      },
      initialRoute: LoginScreen().id,
    );
  }
}

