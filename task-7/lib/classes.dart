class Product {
  Product({
    required this.id,
    required this.category,
    required this.name,
    required this.price,
    required this.amount,
  });

  final int id;
  final String category;
  final String name;
  final int price;
  final int amount;
}

abstract class Filter<T> {
  final T filterValue;

  Filter(this.filterValue);

  bool apply(Product product);
}

class CategoryFilter implements Filter<String> {
  @override
  final String filterValue;

  CategoryFilter(this.filterValue);

  @override
  bool apply(Product product) => product.category == filterValue;
}

class PriceLessThanOrRatherFilter implements Filter<int> {
  @override
  final int filterValue;

  PriceLessThanOrRatherFilter(this.filterValue);

  @override
  bool apply(Product product) => product.price <= filterValue;
}

class AmountLessThanFilter implements Filter<int> {
  @override
  final int filterValue;

  AmountLessThanFilter(this.filterValue);

  @override
  bool apply(Product product) => product.amount < filterValue;
}