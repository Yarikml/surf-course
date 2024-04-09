import 'package:surf_flutter_courses_template/mock/product_list_mock.dart';

import '../../model/receipt_entity.dart';

abstract class ReceiptRepository {
  Future<ReceiptEntity> getReceipt({
    required final int id,
  });
}

class ReceiptRepositoryImpl implements ReceiptRepository {
  @override
  Future<ReceiptEntity> getReceipt({
    required final int id,
  }) async {
    return Future.value(
      ReceiptEntity(
        id: 1,
        date: DateTime(2024, 4, 8, 16, 54),
        products: dataForStudents,
      ),
    );
  }
}
