import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  String nickname = "";
  String text = "";
  String userId = "";
  DateTime dateHour = DateTime.now();

  ChatModel({required this.nickname, required this.text, required this.userId});

  ChatModel.fromJson(Map<String, dynamic> json) {
    nickname = json['nickname'];
    text = json['text'];
    userId = json['userId'];
    dateHour = (json['dateHour'] as Timestamp).toDate();
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {
      'nickname': nickname,
      'text': text,
      'userId': userId,
      'dateHour': Timestamp.fromDate(dateHour)
    };

    return data;
  }
}
