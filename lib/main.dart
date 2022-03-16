
import 'package:architecture_test/redux/reducer.dart';
import 'package:architecture_test/redux/state/state.dart';
import 'package:architecture_test/routes/genereate_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() {
  final store = Store<AppState>(
    appStateReducer,
    initialState: AppState.initial(),
  );
  runApp(MyApp(store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;
  const MyApp(this.store, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Flutter Architecture',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: GenerateRoutes.generateRoute,
        initialRoute: '/',
      ),
    );
  }
}
