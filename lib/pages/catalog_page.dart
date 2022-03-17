import 'package:architecture_test/app_state/app_state.dart';
import 'package:architecture_test/app_state/app_state_bloc.dart';
import 'package:architecture_test/widgets/catalog_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({Key? key}) : super(key: key);

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  late final AppStateBloc _appStateBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _appStateBloc = Provider.of<AppStateBloc>(context);
  }

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
      body: StreamBuilder<AppState>(
        initialData: _appStateBloc.appState,
        stream: _appStateBloc.stream,
        builder: ( context, snapshot) =>
            ListView.builder(
          itemCount: snapshot.data?.catalog.length,
          itemBuilder: (context, index) {
            return CatalogItem(item: snapshot.data!.catalog[index]);
          },
        ),
      ),
    );
  }
}
