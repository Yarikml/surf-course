import 'package:decimal/decimal.dart';
import 'package:intl/intl.dart';

import '../model/product_entity.dart';

class ReceiptCalculator {
  final List<ProductEntity> products;

  late List<Decimal> prices;
  late List<Decimal> pricesWithSale;

  ReceiptCalculator({
    required this.products,
  })  : prices = products.map((item) => item.decimalPrice).toList(),
        pricesWithSale =
            products.map((item) => item.decimalPriceWithSale).toList();

  Decimal get pricesSummary =>
      prices.reduce((value, element) => value += element);

  Decimal get priceSummaryWithSale =>
      pricesWithSale.reduce((value, element) => value += element);

  Decimal get saleAmount => pricesSummary - priceSummaryWithSale;

  int get salePercent =>
      (saleAmount.toDouble() * 100) ~/ pricesSummary.toDouble();
}
