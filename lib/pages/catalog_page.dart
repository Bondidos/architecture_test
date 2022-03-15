import 'package:architecture_test/state_model/app_state_model.dart';
import 'package:architecture_test/widgets/catalog_item.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

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
      body: ScopedModelDescendant<AppStateModel>(
        builder: ( _,  child,  model) =>
            ListView.builder(
          itemCount: model.catalog.length,
          itemBuilder: (context, index) {
            return CatalogItem(item: model.catalog[index]);
          },
        ),
        rebuildOnChange: false,
      ),
    );
  }
}






