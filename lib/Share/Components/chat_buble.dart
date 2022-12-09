import 'package:flutter/material.dart';

import '../../models/messages.dart';
import 'constant.dart';

class ChatBuble extends StatelessWidget {
  final Message message;
  ChatBuble({required this.message});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
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
            ),
            Text(
              message.id,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatBubleFriend extends StatelessWidget {
  final Message message;
  ChatBubleFriend({required this.message});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                  bottomLeft: Radius.circular(32),
                ),
                color: Colors.grey[300],
              ),
              child: Text(
                message.message,
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
            Text(
              message.id,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
