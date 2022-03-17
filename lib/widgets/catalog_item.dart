import 'package:architecture_test/model/catalog_item.dart';
import 'package:architecture_test/widgets/price.dart';
import 'package:flutter/cupertino.dart';

import 'add_button.dart';

class CatalogItem extends StatelessWidget {
  final CatalogModel item;
  const CatalogItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      height: 60,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: Container(color: item.color),
          ),
          Text(item.name),
          Price(price: item.price),
          AddButton(id: item.id,),
        ],
      ),
    );
  }
}