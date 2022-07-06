import 'dart:math';

import 'package:flutter/material.dart';

class SizeConfig {
  static double screenWidth = 0, screenHeight = 0;
  static double cardWidth = 0, cardHeight = 0;

  void setSize(BuildContext context){
    const cardWidthRatio = 813;
    const cardHeightRatio = 1185;
    const double widthHeightRatio = 813/1185;
    const paddingRatio = 0.34;

    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    if (screenHeight/cardHeightRatio > screenWidth/cardWidthRatio) {
      cardHeight = screenHeight * (1-paddingRatio);
      cardWidth = cardHeight*widthHeightRatio;
    } else {
      cardWidth = screenWidth * (1-paddingRatio);
      cardHeight = cardWidth/widthHeightRatio;
    }
  }
}