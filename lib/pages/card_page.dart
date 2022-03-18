import 'package:architecture_test/AppStateBloc/AppStateBloc.dart';
import 'package:architecture_test/widgets/catalog_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/checkout.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    void clear() => context.read<AppStateBloc>().add(ClearCart());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Card"),
      ),
      body: BlocBuilder<AppStateBloc, AppState>(
        builder: (ctx,appState) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Flexible(
                flex: 4,
                child: ListView.builder(
                  itemCount: appState.inCart.length,
                  itemBuilder: (context, index) =>
                      CatalogItem(item: appState.inCart[index]),
                ),
              ),
              Flexible(
                flex: 1,
                child: CheckOut(
                  price: appState.price,
                  checkout: clear,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
