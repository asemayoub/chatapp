import 'package:chatapp/pages/auth/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class chatScreen extends StatelessWidget {
  String id = 'ChatScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Chat Screen'),
        actions: [
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushNamed(context, LoginScreen().id);
              },
              icon: Icon(Icons.logout))
        ],
      ),
    );
  }
}
