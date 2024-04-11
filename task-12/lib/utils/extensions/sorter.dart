import 'dart:core';

import '../../features/receipt/model/product_entity.dart';
import '../../features/receipt/pages/receipt_page/receipt_page.dart';

extension Sorter on List<ProductEntity> {
  List<ProductEntity> sortByRule(SortSubType type) {
    List<ProductEntity> sortedList = List.from(this);
    switch (type) {
      case SortSubType.byPriceIncrease:
        {
          sortedList.sort(
            (a, b) => a.decimalPriceWithSale.compareTo(b.decimalPriceWithSale),
          );
        }
        break;
      case SortSubType.byPriceDecrease:
        {
          sortedList.sort(
            (a, b) => b.decimalPriceWithSale.compareTo(a.decimalPriceWithSale),
          );
        }
        break;
      case SortSubType.byNameFromAToZ:
        {
          sortedList.sort(
            (a, b) => a.title.compareTo(b.title),
          );
        }
        break;
      case SortSubType.byNameFromZToA:
        {
          sortedList.sort(
            (a, b) => b.title.compareTo(a.title),
          );
        }
        break;
      case SortSubType.byTypeFromAToZ:
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
      case SortSubType.byTypeFromZToA:
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
              (a, b) => b.title.compareTo(a.title),
            );
          }
          final result = <ProductEntity>[];
          for (final productsList in categorizedProducts.values) {
            result.addAll(productsList);
          }
          sortedList = result;
        }
        break;
      default:
    }
    return sortedList;
  }
}
