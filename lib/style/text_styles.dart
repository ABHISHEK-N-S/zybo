import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'font_style.dart';

class KStyles {
//!-----------(light)--------------
  Text light({
    required String text,
    Color color = AppColors.white,
    double? height,
    bool? softWrap,
    required double size,
    int? maxLines,
    TextAlign? textAlign,
    TextOverflow overflow = TextOverflow.ellipsis,
    TextDecoration? decoration,
    String? fontFamily,
  }) {
    return Text(
      textAlign: textAlign,
      maxLines: maxLines,
      softWrap: softWrap,
      overflow: overflow,
      text,
      style: TextStyle(
        decoration: TextDecoration.none,
        fontSize: size,
        fontFamily: fontFamily ?? FontConst.sofiaPro,
        height: height,
        color: color,
        fontWeight: FontConst.lightFont,
      ),
    );
  }

//!------------(reg)--------------
  Text reg({
    required String text,
    Color color = AppColors.white,
    double? height,
    bool? softWrap,
    required double size,
    int? maxLines,
    TextAlign? textAlign,
    TextOverflow overflow = TextOverflow.ellipsis,
    String? fontFamily,
    TextDecoration? decoration,
  }) {
    return Text(
      textAlign: textAlign,
      maxLines: maxLines,
      softWrap: softWrap,
      overflow: overflow,
      text,
      style: TextStyle(
        decoration: decoration,
        fontSize: size,
        fontFamily: fontFamily ?? FontConst.sofiaPro,
        height: height,
        color: color,
        fontWeight: FontConst.regularFont,
      ),
    );
  }

//!-------------(med)-------------------
  Text med({
    required String text,
    Color color = AppColors.white,
    double? height,
    bool? softWrap,
    required double size,
    int? maxLines,
    TextAlign? textAlign,
    TextOverflow overflow = TextOverflow.ellipsis,
    TextDecoration? decoration,
    String? fontFamily,
  }) {
    return Text(
      textAlign: textAlign,
      maxLines: maxLines,
      softWrap: softWrap,
      overflow: overflow,
      text,
      style: TextStyle(
        fontSize: size,
        decoration: decoration,
        decorationColor: color,
        fontFamily: fontFamily ?? FontConst.sofiaPro,
        height: height,
        color: color,
        fontWeight: FontConst.mediumFont,
      ),
    );
  }

//!-------------(semibold)------------
  Text semiBold({
    required String text,
    Color color = AppColors.white,
    double? height,
    bool? softWrap,
    required double size,
    int? maxLines,
    TextAlign? textAlign,
    TextOverflow overflow = TextOverflow.ellipsis,
    TextDecoration? decoration,
    String? fontFamily,
  }) {
    return Text(
      textAlign: textAlign,
      maxLines: maxLines,
      softWrap: softWrap,
      overflow: overflow,
      text,
      style: TextStyle(
        fontSize: size,
        decoration: decoration,
        decorationColor: color,
        fontFamily: fontFamily ?? FontConst.sofiaPro,
        height: height,
        color: color,
        fontWeight: FontConst.semiBoldFont,
      ),
    );
  }

//!-------------(bold)------------------
  Text bold({
    required String text,
    Color color = AppColors.white,
    double? height,
    bool? softWrap,
    required double size,
    int? maxLines,
    TextAlign? textAlign,
    TextOverflow overflow = TextOverflow.ellipsis,
    TextDecoration? decoration,
    String? fontFamily,
  }) {
    return Text(
      text, // Ensure this is the first argument
      textAlign: textAlign,
      maxLines: maxLines,
      softWrap: softWrap,
      overflow: overflow,
      style: TextStyle(
        fontSize: size,
        decoration: decoration,
        decorationColor: color,

        fontFamily: fontFamily ?? FontConst.sofiaPro,
        height: height,
        color: color,
        fontWeight: FontWeight.bold, 
      ),
    );
  }

//!---------------(black)-------------------------
  Text black({
    required String text,
    Color color = AppColors.white,
    double? height,
    bool? softWrap,
    required double size,
    int? maxLines,
    TextAlign? textAlign,
    TextOverflow overflow = TextOverflow.ellipsis,
    TextDecoration? decoration,
    String? fontFamily,
  }) {
    return Text(
      textAlign: textAlign,
      maxLines: maxLines,
      softWrap: softWrap,
      overflow: overflow,
      text,
      style: TextStyle(
        fontSize: size,
        decoration: decoration,
        decorationColor: color,
        fontFamily: fontFamily ?? FontConst.sofiaPro,
        height: height,
        color: color,
        fontWeight: FontConst.blackFont,
      ),
    );
  }
}
