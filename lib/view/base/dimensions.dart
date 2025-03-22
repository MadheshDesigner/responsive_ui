import 'package:flutter/material.dart';

class Dimensions {
  static double fontSizeExtraSmall(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width >= 1300) return 14;
    if (width >= 600) return 12;
    return 10;
  }

  static double fontSizeSmall(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width >= 1300) return 16;
    if (width >= 600) return 14;
    return 12;
  }

  static double fontSizeDefault(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width >= 1300) return 18;
    if (width >= 600) return 16;
    return 14;
  }

  static double fontSizeLarge(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width >= 1300) return 20;
    if (width >= 600) return 18;
    return 16;
  }

  static double fontSizeExtraLarge(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width >= 1300) return 22;
    if (width >= 600) return 20;
    return 18;
  }

  static double fontSizeOverLarge(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width >= 1300) return 28;
    if (width >= 600) return 26;
    return 24;
  }
  static double fontSizeOver(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width >= 1300) return 32;
    if (width >= 600) return 30;
    return 28;
  }
}
