import 'dart:ui';

abstract class ColourScheme {
  ColourScheme({
    required this.primaryGray,
    required this.buttonGray,
    required this.primaryBlue,
    required this.secondaryBlue,
    required this.primaryWhite,
    required this.primaryPurple,
    required this.primaryGreen,
    required this.primaryBlack,
    required this.supportBlack,
    required this.supportGrey,
    required this.supportBlueGrey,
    required this.supportBlue,
    required this.primaryOrange,
    required this.primaryRed,
    required this.primaryColor,
    required this.liquidMecury,
    required this.mecureyGrey,
    required this.powderBlue,
  });

  final Color primaryGray;
  final Color buttonGray;
  final Color primaryBlue;
  final Color secondaryBlue;
  final Color primaryWhite;
  final Color primaryPurple;
  final Color primaryGreen;
  final Color primaryBlack;
  final Color supportBlue;
  final Color supportBlack;
  final Color supportGrey;
  final Color supportBlueGrey;
  final Color primaryRed;
  final Color primaryOrange;
  final Color primaryColor;
  final Color liquidMecury;
  final Color mecureyGrey;
  final Color powderBlue;
}

class CustomPrimary implements ColourScheme {
  CustomPrimary(
      {this.primaryGray = const Color(0xFFe2e3e3),
      // this.primaryBlue = const Color.fromRGBO(4, 17, 137, 1),
      this.primaryBlue = const Color.fromARGB(255, 0, 8, 79),
      this.secondaryBlue = const Color.fromRGBO(32, 100, 155, 1),
      this.buttonGray = const Color.fromRGBO(166, 166, 166, 1),
      this.primaryWhite = const Color(0xFFFFFFFF),
      this.primaryPurple = const Color(0xFFEA80FC),
      this.primaryGreen = const Color(0xFF4CAF50),
      this.primaryBlack = const Color(0xFF000000),
      this.supportBlack = const Color(0xFF000000),
      this.supportGrey = const Color(0xFF000000),
      this.supportBlueGrey = const Color(0xFFCFD8DC),
      this.supportBlue = const Color(0xFF2196F3),
      this.primaryRed = const Color(0xFFF44336),
      this.primaryOrange = const Color(0xFFFF992B),
      this.primaryColor = const Color.fromRGBO(255, 191, 0, 1),
      this.liquidMecury = const Color(0xFF98aeb5),
      this.mecureyGrey = const Color(0xFFe3e3e3),
      //  this.powderBlue = const Color.fromARGB(255, 165, 197, 251),
      this.powderBlue = const Color.fromARGB(255, 193, 216, 255)});

  @override
  Color primaryGray;
  @override
  Color primaryBlue;
  @override
  Color secondaryBlue;
  @override
  Color buttonGray;
  @override
  Color primaryWhite;
  @override
  Color primaryPurple;
  @override
  Color primaryGreen;
  @override
  Color primaryBlack;
  @override
  Color supportBlack;
  @override
  Color supportGrey;
  @override
  Color supportBlueGrey;
  @override
  Color supportBlue;
  @override
  Color primaryRed;
  @override
  Color primaryOrange;
  @override
  Color primaryColor;
  @override
  Color liquidMecury;
  @override
  Color mecureyGrey;
  @override
  Color powderBlue;
}
