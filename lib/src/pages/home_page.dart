import 'package:flutter/material.dart';
import 'package:todo_dio/src/components/custom_drawer.dart';
import 'package:todo_dio/src/pages/chat_page.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  var nickController = TextEditingController();
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home'),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Digite seu nickname',
              style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(31, 85, 84, 84),
                hintText: '@username',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
              ),
              controller: nickController,
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton.icon(
                label: const Text('Acessar chat'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) =>
                              ChatPage(nickname: nickController.text)));
                },
                icon: const Icon(Icons.check)),
          ],
        ),
      ),
    ));
  }
}
