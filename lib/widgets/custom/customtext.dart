import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  CustomText(this.text, this.color, this.size, this.weight, this.overflow,
      this.textAlign,
      {this.maxLines});
  final String text;
  final Color color;
  final double size;
  int? maxLines;
  final FontWeight weight;
  final TextOverflow overflow;
  final TextAlign textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      textAlign: textAlign,
      maxLines: maxLines ?? null,
      style: GoogleFonts.montserrat(
        fontSize: size,
        fontWeight: weight,
        color: color,
      ),
    );
  }
}
