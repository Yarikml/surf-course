import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/text/text_style.dart';

class AppTextTheme extends ThemeExtension<AppTextTheme> {
  final TextStyle regular10;
  final TextStyle regular12;
  final TextStyle regular12SaleNewPrice;
  final TextStyle regular12SaleOldPrice;
  final TextStyle regular16;
  final TextStyle bold10;
  final TextStyle bold12;
  final TextStyle bold16;
  final TextStyle bold18;

  AppTextTheme._({
    required this.regular10,
    required this.regular12,
    required this.regular12SaleNewPrice,
    required this.regular12SaleOldPrice,
    required this.regular16,
    required this.bold10,
    required this.bold12,
    required this.bold16,
    required this.bold18,
  });

  /// Base app text theme.
  AppTextTheme.base()
      : regular10 = AppTextStyle.regular10.value,
        regular12 = AppTextStyle.regular12.value,
        regular12SaleNewPrice = AppTextStyle.regular12SaleNewPrice.value,
        regular12SaleOldPrice = AppTextStyle.regular12SaleOldPrice.value,
        regular16 = AppTextStyle.regular16.value,
        bold10 = AppTextStyle.bold10.value,
        bold12 = AppTextStyle.bold12.value,
        bold16 = AppTextStyle.bold16.value,
        bold18 = AppTextStyle.bold18.value;

  @override
  ThemeExtension<AppTextTheme> lerp(
    ThemeExtension<AppTextTheme>? other,
    double t,
  ) {
    if (other is! AppTextTheme) {
      return this;
    }

    return AppTextTheme._(
      regular10: TextStyle.lerp(regular10, other.regular10, t)!,
      regular12: TextStyle.lerp(regular12, other.regular12, t)!,
      regular12SaleNewPrice: TextStyle.lerp(
          regular12SaleNewPrice, other.regular12SaleNewPrice, t)!,
      regular12SaleOldPrice: TextStyle.lerp(
          regular12SaleOldPrice, other.regular12SaleOldPrice, t)!,
      regular16: TextStyle.lerp(regular16, other.regular16, t)!,
      bold10: TextStyle.lerp(bold10, other.bold10, t)!,
      bold12: TextStyle.lerp(bold12, other.bold12, t)!,
      bold16: TextStyle.lerp(bold16, other.bold16, t)!,
      bold18: TextStyle.lerp(bold18, other.bold18, t)!,
    );
  }

  /// Return text theme for app from context.
  static AppTextTheme of(BuildContext context) {
    return Theme.of(context).extension<AppTextTheme>() ??
        _throwThemeExceptionFromFunc(context);
  }

  /// @nodoc.
  @override
  ThemeExtension<AppTextTheme> copyWith({
    TextStyle? regular12,
    TextStyle? regular10,
    TextStyle? regular12SaleNewPrice,
    TextStyle? regular12SaleOldPrice,
    TextStyle? regular16,
    TextStyle? bold10,
    TextStyle? bold12,
    TextStyle? bold16,
    TextStyle? bold18,
  }) {
    return AppTextTheme._(
      regular10: regular12 ?? this.regular10,
      regular12: regular12 ?? this.regular12,
      regular12SaleNewPrice:
          regular12SaleNewPrice ?? this.regular12SaleNewPrice,
      regular12SaleOldPrice:
          regular12SaleOldPrice ?? this.regular12SaleOldPrice,
      regular16: regular16 ?? this.regular16,
      bold10: bold10 ?? this.bold10,
      bold12: bold12 ?? this.bold12,
      bold16: bold16 ?? this.bold16,
      bold18: bold18 ?? this.bold18,
    );
  }
}

Never _throwThemeExceptionFromFunc(BuildContext context) =>
    throw Exception('$AppTextTheme не найдена в $context');
