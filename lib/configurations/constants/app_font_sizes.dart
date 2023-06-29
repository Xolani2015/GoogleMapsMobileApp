abstract class AppSizes {
  AppSizes({
    required this.headerText,
    required this.hearderText2,
    required this.normalText,
    required this.normalText2,
    required this.normalText3,
  });

  final double headerText;
  final double hearderText2;
  final double normalText;
  final double normalText2;
  final double normalText3;
}

class CustomSizes implements AppSizes {
  CustomSizes({
    this.headerText = 50,
    this.hearderText2 = 30,
    this.normalText = 20,
    this.normalText2 = 16,
    this.normalText3 = 12,
  });

  @override
  double headerText;
  @override
  double hearderText2;
  @override
  double normalText;
  @override
  double normalText2;
  @override
  double normalText3;
}
