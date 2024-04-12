import 'dart:core';

import '../../features/receipt/model/product_entity.dart';
import '../../features/receipt/pages/receipt_page/receipt_page.dart';

extension ProductListX on List<ProductEntity> {
  List<ProductEntity> sortBySubType(SortSubType type) {
    final List<ProductEntity> result = switch (type) {
      SortSubType.idle => this,
      SortSubType.byPriceIncrease => sortByPrice(this),
      SortSubType.byPriceDecrease => sortByPrice(this, isIncreasing: false),
      SortSubType.byNameFromAToZ => sortByName(this),
      SortSubType.byNameFromZToA => sortByName(this, isFormAToZ: false),
      SortSubType.byTypeFromAToZ => sortByType(this),
      SortSubType.byTypeFromZToA => sortByType(this, isFormAToZ: false),
    };
    return result;
  }

  List<ProductEntity> sortByPrice(List<ProductEntity> productList,
      {bool isIncreasing = true}) {
    final sortingList = productList;
    sortingList.sort(isIncreasing
        ? (a, b) => a.decimalPriceWithSale.compareTo(b.decimalPriceWithSale)
        : (a, b) => b.decimalPriceWithSale.compareTo(a.decimalPriceWithSale));
    return sortingList;
  }

  List<ProductEntity> sortByName(List<ProductEntity> productList,
      {bool isFormAToZ = true}) {
    final sortingList = productList;
    sortingList.sort(isFormAToZ
        ? (a, b) => a.title.compareTo(b.title)
        : (a, b) => b.title.compareTo(a.title));
    return sortingList;
  }

  List<ProductEntity> sortByType(List<ProductEntity> productList,
      {bool isFormAToZ = true}) {
    final sortingList = productList;
    final categorizedProducts = <Category, List<ProductEntity>>{};
    for (final product in sortingList) {
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
        isFormAToZ
            ? (a, b) => a.title.compareTo(b.title)
            : (a, b) => b.title.compareTo(a.title),
      );
    }
    final result = <ProductEntity>[];
    for (final productsList in categorizedProducts.values) {
      result.addAll(productsList);
    }
    return result;
  }
}
