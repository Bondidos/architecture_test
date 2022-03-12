import 'package:flutter/material.dart';

class Price extends StatelessWidget {
  final int price;
  const Price({Key? key, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(price.toString()),
        const Icon(Icons.monetization_on_outlined),
      ],
    );
  }
}