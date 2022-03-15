import 'package:architecture_test/state_model/app_state_model.dart';
import 'package:architecture_test/widgets/catalog_item.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
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
        child: ScopedModelDescendant<AppStateModel>(
          builder: (context, child, model) => Column(
            children: [
              Flexible(
                flex: 4,
                child: ListView.builder(
                  itemCount: model.card.length,
                  itemBuilder: (context, index) =>
                      CatalogItem(item: model.card[index]),
                ),
              ),
              Flexible(
                flex: 1,
                child: CheckOut(
                  price: model.calculatePrice(),
                  checkout: model.clearCard,
                ),
              ),
            ],
          ),
          rebuildOnChange: true,
        ),
      ),
    );
  }
}
