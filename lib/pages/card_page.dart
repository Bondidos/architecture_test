import 'package:architecture_test/redux/actions/add_item_to_card_action.dart';
import 'package:architecture_test/redux/state/state.dart';
import 'package:architecture_test/widgets/catalog_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
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
        child: StoreBuilder<AppState>(
          builder: (context, store) {
           Function _completeOrder() => store.dispatch(ActionCompleteOrder());
            return Column(
              children: [
                Flexible(
                  flex: 4,
                  child: ListView.builder(
                    itemCount: store.state.inCard.length,
                    itemBuilder: (context, index) =>
                        CatalogItem(item: store.state.inCard[index]),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: CheckOut(
                    price: store.state.getPrice(),
                    checkout: () => _completeOrder,
                  ),
                ),
              ],
            );
          },
          rebuildOnChange: true,
        ),
      ),
    );
  }
}
