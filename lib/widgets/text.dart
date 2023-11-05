import 'dart:ui' as ui show TextHeightBehavior;

import 'package:flutter/material.dart';

class PaddingText extends StatelessWidget {
  PaddingText(
    String this.data, {
    super.key,
    this.padding = EdgeInsets.zero,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
  }) : textSpan = null;

  final String? data;
  final EdgeInsetsGeometry padding;
  final InlineSpan? textSpan;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final ui.TextHeightBehavior? textHeightBehavior;
  final TextWidthBasis? textWidthBasis;

  final Color? selectionColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        data.toString(),
        style: style,
        textAlign: textAlign,
        overflow: overflow,
        textWidthBasis: textWidthBasis,
        textDirection: textDirection,
        softWrap: softWrap,
        maxLines: maxLines,
        locale: locale,
        textHeightBehavior: textHeightBehavior,
        semanticsLabel: semanticsLabel,
        selectionColor: selectionColor,
        strutStyle: strutStyle,
        textScaleFactor: textScaleFactor,
      ),
    );
  }
}
