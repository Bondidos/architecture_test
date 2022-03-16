import 'package:architecture_test/redux/state/state.dart';
import 'package:architecture_test/widgets/catalog_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

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
      body: StoreBuilder<AppState>(
        builder: (context, store) =>
        ListView.builder(
          itemCount: store.state.catalog.length,
          itemBuilder: (context, index) {
            return CatalogItem(item: store.state.catalog[index]);
          },
        ),
        rebuildOnChange: true,
      ),
    );
  }
}






