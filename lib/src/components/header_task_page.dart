import 'package:flutter/material.dart';

class HeaderTaskPage extends StatelessWidget {
  final bool justCompleted;
  final ValueChanged<bool> onChanged;

  HeaderTaskPage(
      {super.key, required this.justCompleted, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text(
          'Apenas não concluidos',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Switch(value: justCompleted, onChanged: onChanged),
      ],
    );
  }
}
