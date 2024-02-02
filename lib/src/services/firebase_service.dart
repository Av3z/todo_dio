import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_dio/src/models/tarefa_model.dart';

class FirebaseService {
  var db = FirebaseFirestore.instance;

  createTodo(TarefaModel tarefa) async {
    await db.collection('tarefas').add(tarefa.toJson());
  }

  Stream<QuerySnapshot> getSnapshots() {
    return db.collection('tarefas').snapshots();
  }

  updateValue(id, TarefaModel tarefa) async {
    await db.collection('tarefas').doc(id).update(tarefa.toJson());
  }

  Stream<QuerySnapshot> getJustCompleted() {
    return db
        .collection('tarefas')
        .where('concluido', isEqualTo: false)
        .snapshots();
  }
}
