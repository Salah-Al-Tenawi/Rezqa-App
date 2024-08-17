import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final int maxLines;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const CustomTextField({
    Key? key,
    required this.label,
    this.maxLines = 1,
    required this.controller,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const SizedBox(width: 20),
        Expanded(
          child: TextField(
            controller: controller,
            onChanged: onChanged,
            maxLines: maxLines,
            decoration: InputDecoration(
              fillColor: Colors.blueAccent,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(23),
              ),
              hintText: 'ادخل نصك هنا',
            ),
          ),
        ),
        Text(
          "  : $label ",
          style: const TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
