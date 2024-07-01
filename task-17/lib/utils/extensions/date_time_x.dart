import 'package:intl/intl.dart';

extension DateTimeX on DateTime {
  String get toFormattedString => DateFormat('dd.MM.yyyy').format(this);
}
