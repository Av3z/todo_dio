import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_dio/src/models/chat_model.dart';
import 'package:todo_dio/src/models/tarefa_model.dart';

class FirebaseService {
  var db = FirebaseFirestore.instance;

  // tasks services
  createTodo(TarefaModel tarefa) async {
    await db.collection('tarefas').add(tarefa.toJson());
  }

  Stream<QuerySnapshot> getSnapshots(userId) {
    return db
        .collection('tarefas')
        .where('userId', isEqualTo: userId)
        .snapshots();
  }

  updateValue(id, TarefaModel tarefa) async {
    tarefa.updatedAt = DateTime.now();
    await db.collection('tarefas').doc(id).update(tarefa.toJson());
  }

  Stream<QuerySnapshot> getJustCompleted(userId) {
    return db
        .collection('tarefas')
        .where('concluido', isEqualTo: false)
        .where('userId', isEqualTo: userId)
        .snapshots();
  }

  // Chat services

  saveChatMessage(ChatModel chat) async {
    await db.collection("chats").add(chat.toJson());
  }

  Stream<QuerySnapshot> getAllMessages() {
    return db.collection('chats').snapshots();
  }
}
