import 'package:architecture_test/model/catalog_item.dart';
import 'package:architecture_test/state_model/app_state_container.dart';
import 'package:architecture_test/widgets/catalog_item.dart';
import 'package:flutter/material.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CatalogModel> catalog =
        AppStateContainer.of(context, rebuild: false)?.state.catalog ?? [];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalog'),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamedAndRemoveUntil(
                context, 'card', (route) => route.settings.name != '/'),
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: catalog.length,
        itemBuilder: (context, index) {
          return CatalogItem(item: catalog[index]);
        },
      ),
    );
  }
}
