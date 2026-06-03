import 'package:flutter/material.dart';

class AppResponsive {
  final BuildContext context;

  AppResponsive({required this.context});

  double get _widthDevice =>
      MediaQuery.sizeOf(context).width;
  double get _heightDevice =>
      MediaQuery.sizeOf(context).height;

  static double baseHeight = 926.0;
  static double baseWidth = 428.0;

  double setFontSize(double inputeSize) {
    double scaleFactor = _widthDevice / baseWidth;

    return inputeSize * scaleFactor;
  }

  double setWidth(double inputeWidth) =>
      _widthDevice * (inputeWidth / baseWidth);

  double setHeight(double inputeHeight) =>
      _heightDevice * (inputeHeight / baseHeight);

  double get headerCardHeight => setHeight(187);
  double get circleHeight => setHeight(116);
  double get circleWidth => setWidth(116);
}
