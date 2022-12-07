import 'package:chatapp/pages/auth/SignUp_page.dart';
import 'package:chatapp/pages/auth/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// Import the generated file
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      routes: {
        LoginScreen().id: (context) => LoginScreen(),
        SignUpScreen().id: (context) => SignUpScreen(),
      },
      initialRoute: LoginScreen().id,
    );
  }
}
