import 'package:chat_app/models/messege.dart';
import 'package:flutter/material.dart';

import 'constance.dart';
class ChatBuble_category extends StatelessWidget {
   ChatBuble_category({required this.message});
 final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin:EdgeInsets.all(10),
        padding: EdgeInsets.only(left: 16,top: 32,bottom: 32,right: 16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          color: kPrimaryColor,
        ),
        child: Text(message.message,style: TextStyle(
          fontSize: 20,
            color: Colors.white),
        ),
      ),
    );
  }
}
class ChatBuble_for_frind extends StatelessWidget {
  ChatBuble_for_frind({required this.message});
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin:EdgeInsets.all(10),
        padding: EdgeInsets.only(left: 16,top: 32,bottom: 32,right: 16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
          color: Color(0xff006D84),
        ),
        child: Text(message.message,style: TextStyle(
            fontSize: 20,
            color: Colors.white),
        ),
      ),
    );
  }
}
