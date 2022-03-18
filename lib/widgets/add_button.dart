import 'package:architecture_test/AppStateBloc/AppStateBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddButton extends StatelessWidget {
  final int id;

  const AddButton({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppStateBloc appStateBloc = BlocProvider.of<AppStateBloc>(context);
    return BlocBuilder<AppStateBloc, AppState>(
        bloc: appStateBloc,
        builder: (ctx,appState) {
          bool inCart = appState.isInCart(id);
          return IconButton(
            onPressed: inCart
            ? () => context.read<AppStateBloc>().add(RemoveItemFromCart(id))
            : () => context.read<AppStateBloc>().add(AddItemToCart(id)),
            icon: inCart
                ? const Icon(Icons.add)
                : const Icon(Icons.remove),
          );
        }
    );
  }
}