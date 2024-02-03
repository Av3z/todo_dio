import 'package:flutter/material.dart';
import 'package:todo_dio/src/models/chat_model.dart';

// ignore: must_be_immutable
class ChatWidget extends StatelessWidget {
  bool myMessage;
  ChatModel chatModel;

  ChatWidget({super.key, required this.myMessage, required this.chatModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: myMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        decoration: BoxDecoration(
            color: myMessage ? Colors.green[900] : Colors.black54,
            borderRadius: BorderRadius.circular(8)),
        child: Text(
          chatModel.text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
