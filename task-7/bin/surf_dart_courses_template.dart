import '../lib/surf_dart_courses_template.dart';

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



void main() {
  const articles = '''
1,хлеб,Бородинский,500,5
2,хлеб,Белый,200,15
3,молоко,Полосатый кот,50,53
4,молоко,Коровка,50,53
5,вода,Апельсин,25,100
6,вода,Бородинский,500,5
''';

  final products = parseProducts(articles);

  final breadCategoryFilter = CategoryFilter('хлеб');
  final priceLessThanOrRather50 = PriceLessThanOrRatherFilter(50);
  final amountLessThan100 = AmountLessThanFilter(100);

  applyFilter(products, breadCategoryFilter);
  print('----------');
  applyFilter(products, priceLessThanOrRather50);
  print('----------');
  applyFilter(products, amountLessThan100);
}