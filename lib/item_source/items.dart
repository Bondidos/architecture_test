import 'package:random_color/random_color.dart';
import 'package:architecture_test/model/catalog_item.dart';
import 'package:mock_data/mock_data.dart';

class GenerateItems {
  final RandomColor _randomColor = RandomColor();

  List<CatalogModel> generateItems(int count) {
    return List<CatalogModel>.generate(
      count,
      (index) => CatalogModel(
        color: _randomColor.randomColor(),
        name: mockString(10),
        price: mockInteger(),
        isAdded: false,
      ),
    );
  }
}
