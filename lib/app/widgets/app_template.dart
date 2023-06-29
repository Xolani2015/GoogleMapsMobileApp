import 'package:flutter/material.dart';

class AppTemplate extends StatefulWidget {
 final Widget pageBody;
  const AppTemplate({super.key, required this.pageBody});

  @override
  State<AppTemplate> createState() => _AppTemplateState();
}

class _AppTemplateState extends State<AppTemplate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.pageBody,
    );
  }
}
