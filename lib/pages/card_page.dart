import 'package:architecture_test/model/catalog_item.dart';
import 'package:architecture_test/state_model/app_state_container.dart';
import 'package:architecture_test/widgets/catalog_item.dart';
import 'package:flutter/material.dart';
import '../widgets/checkout.dart';

class CardPage extends StatefulWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {

    List<CatalogModel> cardList =
        AppStateContainer.of(context, rebuild: true)?.state.cardItems ?? [];

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
                itemCount: cardList.length,
                itemBuilder: (context, index) =>
                    CatalogItem(item: cardList[index]),
              ),
            ),
            const Flexible(
              flex: 1,
              child: CheckOut(
                  /*price: appState?.state.calculateBill() ?? 0,
                checkout: appState?.clearCard(),*/
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
