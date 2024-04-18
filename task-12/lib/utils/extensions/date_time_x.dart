import 'package:intl/intl.dart';

extension DateTimeX on DateTime {
  String get formattedDate => DateFormat('dd.MM.yy').format(this);
  String get formattedTime => DateFormat('HH:mm').format(this);
}
