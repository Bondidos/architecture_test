import 'package:architecture_test/app_state/app_state.dart';
import 'package:architecture_test/app_state/app_state_bloc.dart';
import 'package:architecture_test/app_state/cart_event.dart';
import 'package:architecture_test/widgets/catalog_item.dart';
import 'package:architecture_test/widgets/checkout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardPage extends StatefulWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  late final AppStateBloc _appStateBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _appStateBloc = Provider.of<AppStateBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    void  checkout() => _appStateBloc.sink.add(ClearCart());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Card"),
      ),
      body: StreamBuilder<AppState>(
        initialData: _appStateBloc.appState,
        stream: _appStateBloc.stream,
        builder: (context, snapshot) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Flexible(
                flex: 4,
                child: ListView.builder(
                  itemCount: snapshot.data?.cartItems.length,
                  itemBuilder: (context, index) =>
                      CatalogItem(item: snapshot.data!.cartItems[index]),
                ),
              ),
              Flexible(
                flex: 1,
                child: CheckOut(
                  price: _appStateBloc.appState.calculatePrice,
                  checkout: checkout,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
