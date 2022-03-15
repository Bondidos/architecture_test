import 'package:architecture_test/pages/card_page.dart';
import 'package:architecture_test/pages/app_state.dart';
import 'package:flutter/material.dart';

class GenerateRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const CatalogPage());
      case 'card':
        return MaterialPageRoute(builder: (_) => const CardPage());
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: const Text('Error'),
            ),
            body: const Center(
              child: Text('Error Route'),
            ),
          ),
        );
    }
  }
}
