import 'package:flutter/material.dart';
import 'package:my_clean/core/strings/validation.dart';

class SingleForm extends StatelessWidget {
  const SingleForm({
    super.key,
    required this.controller,
    required this.isTitle,
  });

  final TextEditingController controller;
  final bool isTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        minLines: isTitle ? 1 : 6,
        maxLines: isTitle ? 1 : 6,
        decoration: InputDecoration(
            hintText: isTitle ? 'title' : 'body',
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))),
        validator: (value) {
          if (value!.isEmpty) {
            return isTitle ? Validation.titleVal : Validation.bodyVal;
          } else {
            return null;
          }
        },
      ),
    );
  }
}
