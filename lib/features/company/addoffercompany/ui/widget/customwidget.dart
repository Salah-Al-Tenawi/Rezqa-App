// Custom Radio Button Widget
import 'package:flutter/material.dart';

class CustomRadio<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final ValueChanged<T> onChanged;
  final String text;

  const CustomRadio({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio<T>(
          value: value,
          groupValue: groupValue,
          onChanged: (value) => onChanged(value!),
        ),
        Text(text),
      ],
    );
  }
}

// Custom Text Field Widget
class CustomTextField extends StatelessWidget {
  final String label;
  final int maxLines;
  final ValueChanged<String> onSubmitted;

  const CustomTextField({
    Key? key,
    required this.label,
    this.maxLines = 1,
    required this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const SizedBox(width: 20),
        Expanded(
          child: TextField(
            onSubmitted: onSubmitted,
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

// Main Screen Widget