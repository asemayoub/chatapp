import 'package:flutter/material.dart';

import '../../models/messages.dart';
import 'constant.dart';

class ChatBuble extends StatelessWidget {
  final Message message;
  ChatBuble({required this.message});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
        color: Primarycolor,
      ),
      child: Text(
        message.message,
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }
}
