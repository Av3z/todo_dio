import 'package:flutter/material.dart';
import 'package:todo_dio/src/components/custom_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home'),
      ),
      body: Container(),
    ));
  }
}
