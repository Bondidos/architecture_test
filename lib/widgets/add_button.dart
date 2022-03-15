import 'package:architecture_test/app_state/card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddButton extends StatelessWidget {
  final int id;

  const AddButton({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CardCheck>(
      builder: (context, card, child) => IconButton(
        onPressed: () =>
            card.isInCard(id) ? card.addToCard(id) : card.removeFromCard(id),
        icon: card.isInCard(id)
            ? const Icon(Icons.add)
            : const Icon(Icons.remove),
      ),
    );
  }
}
