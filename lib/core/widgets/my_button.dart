import 'package:flutter/material.dart';
import 'package:my_clean/core/constants/buttons_types.dart';

class MyButton extends StatelessWidget {
  final ButtonTypes buttonType;

  final void Function() myFun;
  const MyButton({super.key, required this.myFun, required this.buttonType});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        onPressed: myFun,
        icon: iconGetter(buttonType),
        label: labelGetter(buttonType),
        style: styleGetter(buttonType));
  }
}

Icon iconGetter(ButtonTypes buttonType) {
  switch (buttonType) {
    case ButtonTypes.post:
      return const Icon(Icons.add);
    case ButtonTypes.update:
      return const Icon(Icons.edit);
    case ButtonTypes.delete:
      return const Icon(Icons.delete);
  }
}

Text labelGetter(ButtonTypes buttonType) {
  switch (buttonType) {
    case ButtonTypes.post:
      return const Text('add post');
    case ButtonTypes.update:
      return const Text('update post');
    case ButtonTypes.delete:
      return const Text('delete post');
  }
}

ButtonStyle styleGetter(ButtonTypes buttonType) {
  switch (buttonType) {
    case ButtonTypes.post:
      return const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.green));
    case ButtonTypes.update:
      return const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.blue));
    case ButtonTypes.delete:
      return const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.red));
  }
}
