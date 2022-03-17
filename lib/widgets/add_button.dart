import 'package:architecture_test/app_state/app_state_bloc.dart';
import 'package:architecture_test/app_state/cart_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddButton extends StatefulWidget {
  final int id;
  const AddButton({Key? key, required this.id}) : super(key: key);

  @override
  State<AddButton> createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  late final AppStateBloc _appStateBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _appStateBloc = Provider.of<AppStateBloc>(context);
  }

  @override
  Widget build(BuildContext context) {

    bool isAdded = _appStateBloc.appState.isInCard(widget.id);
    return IconButton(
      onPressed: isAdded
      ? () => _appStateBloc.sink.add(RemoveItemFromCart(widget.id))
      : () => _appStateBloc.sink.add(AddItemToCart(widget.id)),
      icon: isAdded ? const Icon(Icons.add) : const Icon(Icons.remove),
    );
  }
}