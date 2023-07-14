import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomText extends ConsumerWidget {
  final String text;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Locale? locale;
  final FontStyle? fontStyle;
  final TextAlign? textAlign;
  const CustomText({
    required this.text,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.locale,
    this.textAlign,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      text,
      style: GoogleFonts.nunito(
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
        locale: locale,
        fontStyle: fontStyle,
      ),
      locale: locale,
      textAlign: textAlign,
    );
  }
}
