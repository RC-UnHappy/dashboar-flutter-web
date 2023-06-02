import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final String? hint;
  final InputBorder? inputBorder;
  final String? title;
  final int? maxLines;

  const CustomInput(
      {Key? key,
      this.onChanged,
      this.hint,
      this.inputBorder,
      this.title,
      this.maxLines = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title ?? '',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: TextField(
              maxLines: this.maxLines,
              onChanged: (v) => onChanged!(v),
              decoration: InputDecoration(
                hintText: hint ?? '',
                border: inputBorder,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
