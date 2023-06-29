import 'package:flutter/material.dart';
import 'package:Quickloc8app_attack_mobile_app/configurations/configurations.dart';

class AppContainer extends StatefulWidget {
  const AppContainer({
    super.key,
    required this.widget,
    this.height,
    this.width,
    this.containerColor,
    this.containerShadow,
  });
  final Widget widget;
  final double? height;
  final double? width;
  final Color? containerColor;
  final Color? containerShadow;

  @override
  State<AppContainer> createState() => _AppContainerState();
}

class _AppContainerState extends State<AppContainer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.all(0),
      child: Container(
        child: widget.widget,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: widget.containerColor ?? Configuration().colors.primaryWhite,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(mediaQueryHeight * 0.008),
            bottomRight: Radius.circular(mediaQueryHeight * 0.008),
            topLeft: Radius.circular(mediaQueryHeight * 0.008),
            bottomLeft: Radius.circular(mediaQueryHeight * 0.008),
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 193, 205, 247),
              blurRadius: 6,
              offset: Offset(1, 1),
            ),
          ],
        ),
        height: widget.height ?? mediaQueryHeight * 0.1,
        width: widget.width ?? null,
      ),
    );
  }
}
