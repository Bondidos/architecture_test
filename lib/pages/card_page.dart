import 'package:architecture_test/widgets/catalog_item.dart';
import 'package:flutter/material.dart';

import '../item_source/items.dart';
import '../widgets/checkout.dart';

class CardPage extends StatefulWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  final itemList = GenerateItems().generateItems(20);

  int calculatePrice() {
    int result = 0;
    for (var element in itemList) {
      result += element.price;
    }
    return result;
  }

  void checkout() => setState(() {
    itemList.clear();
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Card"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Flexible(
              flex: 4,
              child: ListView.builder(
                itemCount: itemList.length,
                itemBuilder: (context, index) =>
                    CatalogItem(item: itemList[index]),
              ),
            ),
            Flexible(
              flex: 1,
              child: CheckOut(
                price: calculatePrice(),
                checkout: () => checkout,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
