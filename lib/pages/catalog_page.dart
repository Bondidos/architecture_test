import 'package:architecture_test/AppStateBloc/AppStateBloc.dart';
import 'package:architecture_test/widgets/catalog_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalog'),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, 'card'),
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      body: BlocBuilder<AppStateBloc, AppState>(
        builder: (BuildContext context, AppState appState) =>
            ListView.builder(
          itemCount: appState.catalog.length,
          itemBuilder: (context, index) {
            return CatalogItem(item: appState.catalog[index]);
          },
        ),
      ),
    );
  }
}






