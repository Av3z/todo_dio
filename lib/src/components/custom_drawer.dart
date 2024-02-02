import 'package:flutter/material.dart';
import 'package:todo_dio/src/pages/tarefa_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.task),
            title: const Text('Tarefas'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const TarefaPage(),
                  ));
            },
          )
        ],
      ),
    );
  }
}
