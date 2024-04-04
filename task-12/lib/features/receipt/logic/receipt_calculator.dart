import 'package:intl/intl.dart';

import '../model/product_entity.dart';

class ReceiptCalculator {
  final List<ProductEntity> products;

  late List<int> prices;
  late List<int> pricesWithSale;

  final NumberFormat formatter = NumberFormat("#,###");

  ReceiptCalculator({
    required this.products,
  })  : prices = products.map((item) => item.price).toList(),
        pricesWithSale = products.map((item) => item.priceWithSale).toList();

  int get pricesSummary => prices.reduce((value, element) => value += element);

  String get pricesSummaryInRub =>
      formatter.format(pricesSummary / 100).replaceAll(',', ' ');

  int get priceSummaryWithSale =>
      pricesWithSale.reduce((value, element) => value += element);

  String get priceSummaryWithSaleInRub =>
      formatter.format(priceSummaryWithSale / 100).replaceAll(',', ' ');

  int get sale => pricesSummary - priceSummaryWithSale;

  String get saleInRub => formatter.format(sale / 100).replaceAll(',', ' ');

  int get salePercent => (((sale * 100) / pricesSummary) * 100).truncate();
}
