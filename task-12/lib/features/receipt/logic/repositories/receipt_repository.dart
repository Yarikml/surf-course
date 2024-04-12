import 'package:surf_flutter_courses_template/assets/mock/product_list_mock.dart';
import 'package:surf_flutter_courses_template/features/receipt/model/receipt_entity.dart';

/// Абстракция для репозитория
abstract class ReceiptRepository {
  Future<ReceiptEntity> getReceipt({
    required final int id,
  });
}

///Реализация репозитория для получения чека
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
