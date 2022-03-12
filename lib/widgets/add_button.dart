import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  final bool isAdded;

  const AddButton({Key? key, required this.isAdded}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: isAdded ? const Icon(Icons.add) : const Icon(Icons.remove),
    );
  }
}