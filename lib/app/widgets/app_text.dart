import 'package:flutter/material.dart';

class AppText extends StatefulWidget {
  const AppText({
    super.key,
    required this.text,
    this.color = Colors.black,
    this.fontSize = 12,
    this.fontWeight = FontWeight.normal,
    this.textAlign,
    this.maxLines,
    this.textOverflow,
  });
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? textOverflow;

  @override
  State<AppText> createState() => _AppTextState();
}

class _AppTextState extends State<AppText> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.text,
          textAlign: widget.textAlign,
          style: TextStyle(
            color: widget.color,
            fontSize: widget.fontSize,
            fontWeight: widget.fontWeight,
          ),
          maxLines: widget.maxLines,
          overflow: widget.textOverflow ?? TextOverflow.clip,
        ),
      ],
    );
  }
}
