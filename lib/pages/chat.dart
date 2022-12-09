import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Share/Components/chat_buble.dart';
import '../Share/Components/constant.dart';
import '../models/messages.dart';
import 'auth/login_page.dart';

// class chatScreen extends StatefulWidget {
//
//   @override
//   State<chatScreen> createState() => _chatScreenState();
// }

class chatScreen extends StatelessWidget {
  String id = 'ChatScreen';
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  TextEditingController MessagesController = TextEditingController();
  CollectionReference messages =
      FirebaseFirestore.instance.collection(KeyMessagesCollectionConst);

  @override
  Widget build(BuildContext context) {
    // Setup Collection FireStore Messages

    return FutureBuilder<QuerySnapshot>(
        future: messages.get(),
        builder: (context, Asyncsnapshot) {
          if (Asyncsnapshot.hasData) {
            List<Message> messagesList = [];

            for (int i = 0; i < Asyncsnapshot.data!.docs.length; i++) {
              messagesList.add(Message.fromJson(Asyncsnapshot.data!.docs[i]));
            }

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
                body: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(itemBuilder: (context, index) {
                        return Align(
                            alignment: Alignment.centerLeft,
                            child: ChatBuble());
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8,
                        right: 8,
                        top: 16,
                        bottom: 12,
                      ),
                      child: TextFormField(
                        controller: MessagesController,
                        onFieldSubmitted: (value) {
                          messages.add({
                            KeyMessagesCollectionConst: value,
                          });
                          MessagesController.clear();
                        },
                        decoration: InputDecoration(
                            hintText: 'Send Message',
                            suffixIcon: Icon(Icons.send),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                              width: 1,
                            )),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                                color: Primarycolor,
                              ),
                              borderRadius: BorderRadius.circular(18),
                            )),
                      ),
                    ),
                  ],
                ));
          } else {
            return Text('Loading...');
          }
        });
  }
}
