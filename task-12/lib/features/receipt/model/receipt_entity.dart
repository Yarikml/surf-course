
import 'package:intl/intl.dart';
import 'package:surf_flutter_courses_template/features/receipt/model/product_entity.dart';

class ReceiptEntity {
  final int id;
  final DateTime date;
  final List<ProductEntity> products;

  ReceiptEntity({
    required this.id,
    required this.date,
    required this.products,
  });

}

