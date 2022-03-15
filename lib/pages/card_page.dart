import 'package:architecture_test/app_state/card.dart';
import 'package:architecture_test/app_state/catalog.dart';
import 'package:architecture_test/widgets/catalog_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/checkout.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Card"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<CardCheck>(
          builder: (context, cardState, child) => Column(
            children: [
              Flexible(
                flex: 4,
                child: ListView.builder(
                  itemCount: cardState.card.length,
                  itemBuilder: (context, index) =>
                      CatalogItem(item: cardState.card[index]),
                ),
              ),
              Flexible(
                flex: 1,
                child: CheckOut(
                  price: cardState.getPrice(),
                  checkout: () => cardState.clearCard,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
