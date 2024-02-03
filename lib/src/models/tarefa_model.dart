import 'package:cloud_firestore/cloud_firestore.dart';

class TarefaModel {
  String descricao = "";
  bool concluido = false;
  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();
  String userId = "";

  TarefaModel(
      {required this.descricao, required this.concluido, required this.userId});

  TarefaModel.fromJson(Map<String, dynamic> json) {
    descricao = json['descricao'];
    concluido = json['concluido'];
    createdAt = (json['createdAt'] as Timestamp).toDate();
    updatedAt = (json['updatedAt'] as Timestamp).toDate();
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'descricao': descricao,
      'concluido': concluido,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
      'userId': userId
    };

    return data;
  }
}
