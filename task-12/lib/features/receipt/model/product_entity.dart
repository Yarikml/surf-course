import 'package:decimal/decimal.dart';

import 'package:surf_flutter_courses_template/features/receipt/model/amount.dart';

/// Модель продукта.
///
/// Содержит в себе название, цену, категорию и ссылку на изображение.
class ProductEntity {
  /// Название товара.
  final String title;

  /// Цена товара в копейках. Без скидки.
  ///
  /// Подумайте и ответьте на три вопроса:
  /// 1. Почему цена хранится в копейках, а не в рублях?
  /// 2. Почему тип данных цены - [int], а не [double]?
  /// 3. Как можно было реализовать передачу цены иначе?
  ///
  /// Ответы на вопросы разместите тут (они будут проверены при код-ревью):
  /// 1. Цена зачастую дробное число, поэтому логичнее хранить в минимально возможной единице измерения,
  /// тк это всегда целое число и можно избежать возможных погрешностей при математических операциях с double
  /// 2. Так как цена хранится в копейках, у нее не может быть дробной части, тк копейка наименьшая единица измерения
  /// [ОТВЕТЫ]
  final int price;

  /// Категория товара.
  final Category category;

  /// Ссылка на изображение товара.
  final String imageUrl;

  /// Количество товара.
  ///
  /// Может быть описано в граммах [Grams] или в штуках [Quantity].
  final Amount amount;

  /// Скидка на товар.
  ///
  /// Требуется высчитать самостоятельно итоговую цену товара.
  final double sale;

  ProductEntity({
    required this.title,
    required this.price,
    required this.category,
    required this.imageUrl,
    required this.amount,
    this.sale = 0,
  });

  bool get hasSale => sale > 0;

  Decimal get decimalPriceWithSale =>
      hasSale ? _toDecimalPriceWithSale(price, sale) : _toDecimalPrice(price);

  Decimal get decimalPrice => _toDecimalPrice(price);

  ///Метод перевода цены в Decimal тип для корректного выполнения дальнейших операций
  Decimal _toDecimalPrice(int price) {
    final priceString = (price / 100).toStringAsFixed(2);
    return Decimal.parse(priceString);
  }

  ///Метод перевода цены со скидкой в Decimal тип для корректного выполнения дальнейших операций
  Decimal _toDecimalPriceWithSale(int price, double sale) {
    final priceString =
        ((price - (price * (sale / 100))) / 100).toStringAsFixed(2);
    return Decimal.parse(priceString);
  }
}

/// Категория товара.
enum Category {
  food('Продукты питания'),
  tech('Технологичные товары'),
  care('Уход'),
  drinks('Напитки'),
  drugs('Медикаменты');

  final String name;

  const Category(this.name);
}
