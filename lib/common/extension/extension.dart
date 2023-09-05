import 'package:intl/intl.dart';
import 'package:money_formatter/money_formatter.dart';

class DateTimeFormat {
  static const String dateFormatWithSlash = "yyyy/MM/dd";
}

extension DateTimeExt on DateTime {
  String format(String pattern) => DateFormat(pattern).format(this);
}

extension StringExt on String {
  String? get numberFormat => MoneyFormatter(amount: double.parse(this)).output.withoutFractionDigits;
}
