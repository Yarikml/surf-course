import 'package:surf_dart_courses_template/classes.dart';
import 'package:surf_dart_courses_template/functions.dart';





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