import 'package:flutter/material.dart';

class BodyTaskPage extends StatelessWidget {
  final Function(bool) onChanged;
  final Text title;
  final bool value;
  BodyTaskPage(
      {super.key,
      required this.onChanged,
      required this.title,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black12, borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: const Icon(Icons.list_alt_rounded),
        title: title,
        trailing: Switch(
          value: value,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
