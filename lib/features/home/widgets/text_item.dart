import 'package:flutter/material.dart';

class TextItemWidget extends StatelessWidget {
  const TextItemWidget({super.key, required this.title, this.value});
  final String title;
  final String? value;
  @override
  Widget build(BuildContext context) {
    return value == null || value == ''
        ? const SizedBox.shrink()
        : Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 4.0,
              ),
              Text(
                title,
                style: TextStyle(color: Colors.purple),
              ),
              Flexible(child: Text(value!))
            ],
          );
  }
}
