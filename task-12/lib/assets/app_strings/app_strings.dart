///Примитивная реализация локализации
class AppStrings {
  static String get inWork => 'В разработке';

  static String get catalog => 'Каталог';

  static String get search => 'Поиск';

  static String get trash => 'Корзина';

  static String get cabinet => 'Личное';

  static String get productList => 'Список покупок';

  static String get error => 'При получении данных произошла ошибка';

  static String get sorting => 'Сортировка';

  static String get done => 'Готово';

  static String get inYourTrash => 'В вашей покупке';

  static String get finallyPrice => 'Итого';

  static String receiptNumber(String receiptId) => 'Чек № $receiptId';

  static String salePercent(int salePercent) => 'Скидка $salePercent%';

  static String saleAmount(String saleAmount) => '- $saleAmount';

  static String receiptDateTime(
    String date,
    String time,
  ) =>
      '$date в $time';
}
