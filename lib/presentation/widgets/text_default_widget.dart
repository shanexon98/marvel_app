import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextDefault extends StatelessWidget {
  const TextDefault(
      {Key? key,
      required this.sizeText,
      required this.colorText,
      required this.text,
      this.fontWeight = FontWeight.w400,
      this.textAlign,
      this.overflow = TextOverflow.ellipsis})
      : super(key: key);

  final double sizeText;
  final Color colorText;
  final String text;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.marvel(
        textStyle: TextStyle(
            shadows: const [
              Shadow(
                color: Color.fromARGB(255, 255, 0, 0),
                offset: Offset(2, 2),
                blurRadius: 3,
              ),
            ],
            overflow: overflow,
            color: colorText,
            fontSize: sizeText,
            fontWeight: fontWeight),
      ),
    );
  }
}
