import 'package:architecture_test/state_model/app_state_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class AddButton extends StatelessWidget {
  final int id;
  const AddButton({Key? key,required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppStateModel>(
      builder: (context,_, model) => IconButton(
        onPressed: () => model.isInCard(id)
            ? model.removeItem(id)
            : model.addItem(id),
        icon: model.isInCard(id) ? const Icon(Icons.add) : const Icon(Icons.remove),
      ),
      rebuildOnChange: true,
    );
  }
}