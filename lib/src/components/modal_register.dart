import 'package:flutter/material.dart';

class ModalRegister extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final VoidCallback onCancel;
  final VoidCallback onConfirm;

  const ModalRegister({
    super.key,
    required this.title,
    required this.controller,
    required this.onCancel,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: TextField(
        controller: controller,
      ),
      actionsAlignment: MainAxisAlignment.spaceAround,
      actions: [
        IconButton(
          onPressed: onCancel,
          icon: const Icon(
            Icons.close,
            color: Colors.red,
          ),
        ),
        IconButton(
          onPressed: onConfirm,
          icon: const Icon(
            Icons.check,
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}
