import 'package:architecture_test/state_model/app_state_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  final int id;

  const AddButton({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppStateContainerState appState = AppStateContainer.of(context, rebuild: true)!;
    print('rebuild');
    return IconButton(
      onPressed: () => appState.state.isInCard(id)
      ? appState.removeFromCard(id)
      : appState.addItem(id),
      icon: appState.state.isInCard(id)
          ? const Icon(Icons.add)
          : const Icon(Icons.remove),
    );
  }
}