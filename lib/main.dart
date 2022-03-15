import 'package:architecture_test/app_state/card.dart';
import 'package:architecture_test/app_state/catalog.dart';
import 'package:architecture_test/routes/genereate_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => Catalog(),),
        ChangeNotifierProxyProvider<Catalog,CardCheck>(
            create: (_) => CardCheck(),
            update: (context, catalog, card) {
                card?.catalog = catalog;
                return card!;
            },
        )

      ],
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
