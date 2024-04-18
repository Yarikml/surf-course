import 'package:surf_flutter_courses_template/features/receipt/model/amount.dart';

extension AmountX on Amount {
  String get toFormattedString {
    switch (this) {
      case Grams():
        return (value / 1000).toString();
      case Quantity():
        return value.toString();
    }
  }

  String get caption {
    switch (this) {
      case Grams():
        return 'кг';
      case Quantity():
        return 'шт';
    }
  }
}
