import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final ValueChanged<bool>? onChanged;
  final String? title;
  final bool? value;

  const CustomCheckbox({
    Key? key,
    this.onChanged,
    this.title,
    this.value,
  }) : super(key: key);

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
          Checkbox(
            value: value ?? false,
            onChanged: (parama) {},
          ),
        ],
      ),
    );
  }
}
