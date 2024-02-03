import 'package:flutter/material.dart';
import 'package:todo_dio/src/pages/splash_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SplashScreen(),
    );
  }
}
