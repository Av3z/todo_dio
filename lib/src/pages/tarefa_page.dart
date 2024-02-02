import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_dio/src/components/body_task_page.dart';
import 'package:todo_dio/src/components/header_task_page.dart';
import 'package:todo_dio/src/components/modal_register.dart';
import 'package:todo_dio/src/models/tarefa_model.dart';
import 'package:todo_dio/src/services/firebase_service.dart';

class TarefaPage extends StatefulWidget {
  const TarefaPage({super.key});

  @override
  State<TarefaPage> createState() => _TarefaPageState();
}

class _TarefaPageState extends State<TarefaPage> {
  TextEditingController tarefaController = TextEditingController();
  FirebaseService firebaseService = FirebaseService();
  bool justCompleted = false;

  @override
  Widget build(BuildContext context) {
    onPress() {
      showDialog(
        context: context,
        builder: (context) {
          return ModalRegister(
              title: "Cadastrar",
              controller: tarefaController,
              onCancel: () {
                Navigator.pop(context);
              },
              onConfirm: () async {
                var tarefa = TarefaModel(
                    descricao: tarefaController.text, concluido: false);
                await firebaseService.createTodo(tarefa);

                // ignore: use_build_context_synchronously
                Navigator.pop(context);
              });
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Tarefas'),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: onPress, child: const Icon(Icons.task)),
      body: SafeArea(
          child: Column(
        children: [
          // Header page
          HeaderTaskPage(
              justCompleted: justCompleted,
              onChanged: (value) {
                justCompleted = value;
                setState(() {});
              }),

          // Body page with list task
          Expanded(
              child: StreamBuilder<QuerySnapshot>(
            stream: !justCompleted
                ? firebaseService.getSnapshots()
                : firebaseService.getJustCompleted(),
            builder: (context, snapshot) {
              return !snapshot.hasData
                  ? const CircularProgressIndicator()
                  : ListView(
                      children: snapshot.data!.docs.map((e) {
                        var tarefa = TarefaModel.fromJson(
                            e.data() as Map<String, dynamic>);
                        return BodyTaskPage(
                            onChanged: (value) async {
                              tarefa.concluido = value;
                              await firebaseService.updateValue(e.id, tarefa);
                            },
                            title: Text(tarefa.descricao),
                            value: tarefa.concluido);
                      }).toList(),
                    );
            },
          ))
        ],
      )),
    );
  }
}
