
import 'classes.dart';

void applyFilter(List<Product> products, Filter filterType) {
  final filteredProducts = products.where(filterType.apply).toList();
  for (Product product in filteredProducts) {
    print(
        '${product.id}  ${product.category} ${product.name} ${product.price} рублей ${product.amount} шт');
  }
}

List<Product> parseProducts(String data) {
  final splittedProducts = data.split('\n');

  List<Product> products = [];

  for (String productString in splittedProducts) {
    final parsedFields = productString.split(',');
    if (parsedFields.length == 5) {
      products.add(Product(
        id: int.parse(parsedFields[0]),
        category: parsedFields[1],
        name: parsedFields[2],
        price: int.parse(parsedFields[3]),
        amount: int.parse(parsedFields[4]),
      ));
    }
  }

  return products;
}