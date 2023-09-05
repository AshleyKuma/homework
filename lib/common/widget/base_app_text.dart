import 'package:flutter/material.dart';

abstract class AppFontWeight extends Object {
  static const FontWeight extraLight = FontWeight.w200;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight black = FontWeight.w800;

  AppFontWeight._();
}

enum AppTextType {
  SEMI_BOLD_24,
  SEMI_BOLD_22,
  SEMI_BOLD_20,
  SEMI_BOLD_18,
  SEMI_BOLD_17,
  SEMI_BOLD_15,

  REGULAR_17,
  REGULAR_16,
  REGULAR_15,
  REGULAR_14,
  REGULAR_13,
}

extension AppTextTypeExt on AppTextType {
  static const TextStyle baseStyle = TextStyle(letterSpacing: 1, height: 1.5, color: Colors.black);

  TextStyle get style {
    switch (this) {
      case AppTextType.SEMI_BOLD_24:
        return baseStyle.merge(TextStyle(fontSize: 24, fontWeight: AppFontWeight.semiBold));

      case AppTextType.SEMI_BOLD_22:
        return baseStyle.merge(TextStyle(fontSize: 22, fontWeight: AppFontWeight.semiBold));

      case AppTextType.SEMI_BOLD_20:
        return baseStyle.merge(TextStyle(fontSize: 20, fontWeight: AppFontWeight.semiBold));

      case AppTextType.SEMI_BOLD_18:
        return baseStyle.merge(TextStyle(fontSize: 18, fontWeight: AppFontWeight.semiBold));

      case AppTextType.SEMI_BOLD_17:
        return baseStyle.merge(TextStyle(fontSize: 17, fontWeight: AppFontWeight.semiBold));

      case AppTextType.SEMI_BOLD_15:
        return baseStyle.merge(TextStyle(fontSize: 15, fontWeight: AppFontWeight.semiBold));

      case AppTextType.REGULAR_17:
        return baseStyle.merge(TextStyle(fontSize: 17, fontWeight: AppFontWeight.regular));

      case AppTextType.REGULAR_16:
        return baseStyle.merge(TextStyle(fontSize: 16, fontWeight: AppFontWeight.regular));

      case AppTextType.REGULAR_15:
        return baseStyle.merge(TextStyle(fontSize: 15, fontWeight: AppFontWeight.regular));

      case AppTextType.REGULAR_14:
        return baseStyle.merge(TextStyle(fontSize: 14, fontWeight: AppFontWeight.regular));

      case AppTextType.REGULAR_13:
        return baseStyle.merge(TextStyle(fontSize: 13, fontWeight: AppFontWeight.regular));
    }
  }
}

class BaseAppText {
  BaseAppText._();

  static Widget semiBold24({required String text, TextStyle? style, TextAlign align = TextAlign.left, int? maxLines, overflow = TextOverflow.clip}) => Text(
        text,
        style: AppTextType.SEMI_BOLD_24.style.merge(style),
        textAlign: align,
        maxLines: maxLines,
        overflow: overflow,
      );

  static Widget semiBold22({required String text, TextStyle? style, TextAlign align = TextAlign.left, int? maxLines, overflow = TextOverflow.clip}) => Text(
        text,
        style: AppTextType.SEMI_BOLD_22.style.merge(style),
        textAlign: align,
        maxLines: maxLines,
        overflow: overflow,
      );

  static Widget semiBold20({required String text, TextStyle? style, TextAlign align = TextAlign.left, int? maxLines, overflow = TextOverflow.clip}) => Text(
        text,
        style: AppTextType.SEMI_BOLD_20.style.merge(style),
        textAlign: align,
        maxLines: maxLines,
        overflow: overflow,
      );

  static Widget semiBold18({required String text, TextStyle? style, TextAlign align = TextAlign.left, int? maxLines, overflow = TextOverflow.clip}) => Text(
        text,
        style: AppTextType.SEMI_BOLD_18.style.merge(style),
        textAlign: align,
        maxLines: maxLines,
        overflow: overflow,
      );

  static Widget semiBold17({required String text, TextStyle? style, TextAlign align = TextAlign.left, int? maxLines, overflow = TextOverflow.clip}) => Text(
        text,
        style: AppTextType.SEMI_BOLD_17.style.merge(style),
        textAlign: align,
        maxLines: maxLines,
        overflow: overflow,
      );

  static Widget semiBold15({required String text, TextStyle? style, TextAlign align = TextAlign.left, int? maxLines, overflow = TextOverflow.clip}) => Text(
        text,
        style: AppTextType.SEMI_BOLD_15.style.merge(style),
        textAlign: align,
        maxLines: maxLines,
        overflow: overflow,
      );

  static Widget regular17({required String text, TextStyle? style, TextAlign align = TextAlign.left, int? maxLines, overflow = TextOverflow.clip}) => Text(
        text,
        style: AppTextType.REGULAR_17.style.merge(style),
        textAlign: align,
        maxLines: maxLines,
        overflow: overflow,
      );

  static Widget regular16({required String text, TextStyle? style, TextAlign align = TextAlign.left, int? maxLines, overflow = TextOverflow.clip}) => Text(
        text,
        style: AppTextType.REGULAR_16.style.merge(style),
        textAlign: align,
        maxLines: maxLines,
        overflow: overflow,
      );

  static Widget regular15({required String text, TextStyle? style, TextAlign align = TextAlign.left, int? maxLines, overflow = TextOverflow.clip}) => Text(
        text,
        style: AppTextType.REGULAR_15.style.merge(style),
        textAlign: align,
        maxLines: maxLines,
        overflow: overflow,
      );

  static Widget regular14({required String text, TextStyle? style, TextAlign align = TextAlign.left, int? maxLines, overflow = TextOverflow.clip}) => Text(
        text,
        style: AppTextType.REGULAR_14.style.merge(style),
        textAlign: align,
        maxLines: maxLines,
        overflow: overflow,
      );

  static Widget regular13({required String text, TextStyle? style, TextAlign align = TextAlign.left, int? maxLines, overflow = TextOverflow.clip}) => Text(
        text,
        style: AppTextType.REGULAR_13.style.merge(style),
        textAlign: align,
        maxLines: maxLines,
        overflow: overflow,
      );
}
