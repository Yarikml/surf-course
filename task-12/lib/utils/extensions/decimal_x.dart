import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import 'package:intl/intl.dart';

extension DecimalX on Decimal {
  String toFormattedCurrency({
    String? symbol,
    int? decimalDigits,
  }) {
    final currencyFormatter = NumberFormat.currency(
      locale: 'Ru_ru',
      symbol: symbol ?? 'руб',
      decimalDigits: decimalDigits ?? 2,
    );
    return currencyFormatter.format(DecimalIntl(this));
  }
}
