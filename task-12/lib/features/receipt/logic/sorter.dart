import 'dart:core';

import 'package:surf_flutter_courses_template/features/receipt/model/product_entity.dart';
import 'package:surf_flutter_courses_template/features/receipt/pages/receipt_page/receipt_page.dart';

class IncreasePriceRule implements Comparable<ProductEntity> {
  final ProductEntity value;

  IncreasePriceRule({
    required this.value,
  });

  @override
  int compareTo(ProductEntity other) => value.price.compareTo(other.price);
}

extension Sorter on List<ProductEntity> {
  Future<List<ProductEntity>> sortByRule(SortType type) {
    List<ProductEntity> sortedList = List.from(this);
    switch (type) {
      case SortType.byPriceIncrease:
        {
          sortedList.sort(
            (a, b) => a.priceWithSale.compareTo(b.priceWithSale),
          );
        }
        break;
      case SortType.byPriceDecrease:
        {
          sortedList.sort(
            (a, b) => b.priceWithSale.compareTo(a.priceWithSale),
          );
        }
        break;
      case SortType.byNameFromAToZ:
        {
          sortedList.sort(
            (a, b) => a.title.compareTo(b.title),
          );
        }
        break;
      case SortType.byNameFromZToA:
        {
          sortedList.sort(
            (a, b) => b.title.compareTo(a.title),
          );
        }
        break;
      case SortType.byTypeFromAToZ:
        {
          final categorizedProducts = <Category, List<ProductEntity>>{};
          for (final product in sortedList) {
            if (categorizedProducts.containsKey(product.category)) {
              categorizedProducts[product.category]?.add(product);
            } else {
              categorizedProducts.addAll({
                product.category: [product]
              });
            }
          }
          for (final categoryKey in categorizedProducts.keys) {
            categorizedProducts[categoryKey]?.sort(
              (a, b) => a.title.compareTo(b.title),
            );
          }
          final result = <ProductEntity>[];
          for (final productsList in categorizedProducts.values) {
            result.addAll(productsList);
          }
          sortedList = result;
        }
        break;
      case SortType.byTypeFromZToA:
        {}
        break;
      default:
    }
    return Future.value(sortedList);
  }
}
