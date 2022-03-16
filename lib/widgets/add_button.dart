import 'package:architecture_test/redux/actions/add_item_to_card_action.dart';
import 'package:architecture_test/redux/state/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/src/store.dart';

class AddButton extends StatelessWidget {
  final int id;

  const AddButton({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _IconButtonViewModel>(
        converter: (store) => _IconButtonViewModel(store),
        builder: (context, viewModel) {
          final bool isInCard = viewModel.isInCard(id);
          return IconButton(
            onPressed: isInCard
                ? () => viewModel.removeFromCard(id)
                : () => viewModel.adToCard(id),
            icon: isInCard ? const Icon(Icons.add) : const Icon(Icons.remove),
          );
        });
  }
}

class _IconButtonViewModel {
  final Store<AppState> store;

  _IconButtonViewModel(this.store);

  bool isInCard(int id) => store.state.isInCard(id);

  void adToCard(int id) => store.dispatch(ActionAddItemToCard(id));

  void removeFromCard(int id) => store.dispatch(ActionRemoveItemFromCard(id));

  void completeOrder() => store.dispatch(ActionCompleteOrder());
}
