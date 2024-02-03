import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_dio/src/components/chat_widget.dart';
import 'package:todo_dio/src/models/chat_model.dart';
import 'package:todo_dio/src/services/firebase_service.dart';

class ChatPage extends StatefulWidget {
  final String nickname;
  const ChatPage({super.key, required this.nickname});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final textController = TextEditingController(text: "");
  FirebaseService firebaseService = FirebaseService();
  String userId = '';

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    userId = prefs.getString('userId')!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(centerTitle: true, title: const Text('Chat')),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Content View
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: firebaseService.getAllMessages(),
                    builder: (context, snapshot) {
                      return !snapshot.hasData
                          ? const CircularProgressIndicator()
                          : ListView(
                              children: snapshot.data!.docs.map((e) {
                                var chatModel = ChatModel.fromJson(
                                    (e.data() as Map<String, dynamic>));
                                return ChatWidget(
                                    myMessage: chatModel.userId == userId,
                                    chatModel: chatModel);
                              }).toList(),
                            );
                    },
                  ),
                ),

                // Send message
                Container(
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(8)),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.emoji_emotions_sharp)),
                      Expanded(
                        child: TextField(
                          decoration:
                              const InputDecoration(border: InputBorder.none),
                          controller: textController,
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.attach_file)),
                      IconButton(
                          onPressed: () async {
                            ChatModel chat = ChatModel(
                                nickname: widget.nickname,
                                text: textController.text,
                                userId: userId);
                            await firebaseService.saveChatMessage(chat);
                            textController.text = "";
                          },
                          icon: const Icon(Icons.send))
                    ],
                  ),
                )
              ],
            )));
  }
}
