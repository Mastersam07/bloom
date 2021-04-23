import 'package:flutter/material.dart';

class SimpleText extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight weight;
  final double size;
  final int maxLines;
  final TextAlign textAlign;

  const SimpleText(
    this.text, {
    Key key,
    this.color,
    this.weight,
    this.size,
    this.maxLines = null,
    this.textAlign,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      '$text',
      textAlign: textAlign,
      maxLines: maxLines,
      softWrap: true,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
      style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: size,
          fontWeight: weight,
          color: color),
    );
  }
}
