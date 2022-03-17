import 'package:flutter/material.dart';

class CheckOut extends StatelessWidget {
  final int price;
  final Function checkout;

  const CheckOut({Key? key, required this.price, required this.checkout})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Theme.of(context).secondaryHeaderColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Price: $price'),
          ElevatedButton(
            onPressed: () => checkout(),
            child: const Text('CheckOut'),
          )
        ],
      ),
    );
  }
}
