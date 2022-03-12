import 'package:architecture_test/item_source/items.dart';
import 'package:architecture_test/widgets/catalog_item.dart';
import 'package:flutter/material.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemList = GenerateItems().generateItems(20);
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
      body: ListView.builder(
        itemCount: itemList.length,
        itemBuilder: (context, index) {
          return CatalogItem(item: itemList[index]);
        },
      ),
    );
  }
}






