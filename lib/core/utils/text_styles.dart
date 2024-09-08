
import 'package:flutter/material.dart';
import 'package:tadmon/core/utils/colors.dart';


class TextStyles {
  static TextStyle textXLarge = const TextStyle(
    fontSize: 40,
    color: ColorCode.titleblack,
    fontWeight: FontWeight.bold,
    height: 1.2,
  );
  static TextStyle textLarge = const TextStyle(
    fontSize: 20,
    color: ColorCode.titleblack,
    fontWeight: FontWeight.w700,
    height: 1.2,
  );

  static const TextStyle textMedium = TextStyle(
    fontSize: 18,
    color: ColorCode.titleblack,
    fontWeight: FontWeight.w700,
    height: 1.2,
  );
  static  TextStyle textMedium2 = const TextStyle(
    fontSize: 16,
    color: ColorCode.titleblack,
    fontWeight: FontWeight.w700,
    height: 1.2,
  );
  static TextStyle textSmall = const TextStyle(
    fontSize: 14,
    height: 1,
    color: ColorCode.titleblack,
    fontWeight: FontWeight.w700,
  );
  static TextStyle textXSmall = const TextStyle(
    fontSize: 12,
    color: ColorCode.titleblack,
    fontWeight: FontWeight.w500,
  );
}
