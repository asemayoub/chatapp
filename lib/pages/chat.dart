import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Share/Components/chat_buble.dart';
import '../Share/Components/constant.dart';
import '../models/messages.dart';
import 'auth/login_page.dart';

class chatScreen extends StatelessWidget {
  String id = 'ChatScreen';
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  TextEditingController MessagesController = TextEditingController();
  CollectionReference messages =
      FirebaseFirestore.instance.collection(KeyMessagesCollectionConst);

  final ScrollController ControllerScroll = ScrollController();

  void scrollDown() {
    ControllerScroll.animateTo(0,
        duration: Duration(seconds: 1), curve: Curves.fastLinearToSlowEaseIn);
  }

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;

    // Setup Collection FireStore Messages

    return StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy(timeConst, descending: true).snapshots(),
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
                      child: ListView.builder(
                          reverse: true,
                          controller: ControllerScroll,
                          itemCount: messagesList.length,
                          itemBuilder: (context, index) {
                            return messagesList[index].id == email
                                ? ChatBuble(
                                    message: messagesList[index],
                                  )
                                : ChatBubleFriend(message: messagesList[index]);
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
                            KMessageConst: value,
                            timeConst: DateTime.now(),
                            'idEmail': email,
                          });
                          MessagesController.clear();
                          scrollDown();
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
