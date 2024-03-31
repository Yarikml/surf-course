import '../model/product_entity.dart';

class ReceiptCalculator {
  final List<ProductEntity> products;

  late List<int> prices;
  late List<int> pricesWithSale;

  ReceiptCalculator({
    required this.products,
  })  : prices = products.map((item) => item.price).toList(),
        pricesWithSale = products.map((item) => item.priceWithSale).toList();

  int get pricesSummary => prices.reduce((value, element) => value += element);

  double get pricesSummaryInRub => pricesSummary / 100;

  int get priceSummaryWithSale =>
      pricesWithSale.reduce((value, element) => value += element);

  double get priceSummaryWithSaleInRub => priceSummaryWithSale / 100;

  int get sale => pricesSummary - priceSummaryWithSale;

  double get saleInRub => sale / 100;

  int get salePercent => (((sale * 100) / pricesSummary) * 100).truncate();
}
