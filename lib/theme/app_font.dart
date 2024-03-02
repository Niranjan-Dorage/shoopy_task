import 'package:flutter/material.dart';
import 'package:shoopy_whatsapp_task/theme/app_color.dart';

class FontThemeClass {
  TextStyle display(BuildContext ctx, {Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontSize: 42,
      fontFamily: 'Outfit',
      fontWeight: fontWeight ?? FontWeight.w300,
      color: color ?? AppColorScheme().white,
    );
  }

  TextStyle header(BuildContext ctx, {Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontSize: 34,
      fontFamily: 'Outfit',
      fontWeight: fontWeight ?? FontWeight.w700,
      color: color ?? AppColorScheme().white,
    );
  }

  TextStyle eventCard(BuildContext ctx,
      {Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontSize: 30,
      fontFamily: 'Outfit',
      fontWeight: fontWeight ?? FontWeight.w600,
      color: color ?? AppColorScheme().white,
    );
  }

  TextStyle title(BuildContext ctx, {Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontSize: 28,
      fontFamily: 'Outfit',
      fontWeight: fontWeight ?? FontWeight.w500,
      color: color ?? AppColorScheme().white,
    );
  }

  TextStyle title2(BuildContext ctx, {Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontSize: 22,
      fontFamily: 'Outfit',
      fontWeight: fontWeight ?? FontWeight.w300,
      color: color ?? AppColorScheme().white,
    );
  }

  TextStyle paragraph(BuildContext ctx,
      {Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontSize: 18,
      fontFamily: 'Outfit',
      fontWeight: fontWeight ?? FontWeight.w400,
      color: color ?? AppColorScheme().white,
    );
  }

  TextStyle body(BuildContext ctx, {Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontSize: 16,
      fontFamily: 'Outfit',
      fontWeight: fontWeight ?? FontWeight.w400,
      color: color ?? AppColorScheme().white,
    );
  }

  TextStyle caption(BuildContext ctx, {Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontSize: 14,
      fontFamily: 'Outfit',
      fontWeight: fontWeight ?? FontWeight.w400,
      color: color ?? AppColorScheme().white,
    );
  }

  TextStyle small(BuildContext ctx, {Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontSize: 13,
      fontFamily: 'Outfit',
      fontWeight: fontWeight ?? FontWeight.w400,
      color: color ?? AppColorScheme().white,
    );
  }
}
