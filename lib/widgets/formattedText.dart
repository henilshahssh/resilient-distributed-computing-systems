import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sepb_web_app/util/constants.dart';

class FormattedText extends StatefulWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;

  const FormattedText(
      {super.key,
      required this.text,
      this.color = primaryColor,
      this.fontSize = 18,
      this.fontWeight = FontWeight.normal});

  @override
  State<FormattedText> createState() => _FormattedTextState();
}

class _FormattedTextState extends State<FormattedText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: GoogleFonts.openSans(
        textStyle: TextStyle(
          color: widget.color,
          fontSize: widget.fontSize,
          fontWeight: widget.fontWeight,
        ),
      ),
    );
  }
}
