import 'package:flutter/material.dart';

enum DeviceType { mobile, tablet, desktop }

class GlobalFunction {
  // Enum should be defined outside the method

  DeviceType getDeviceType(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    // Defining breakpoints based on width
    if (width <= 600) {
      return DeviceType.mobile; // Mobile
    } else if (width > 600 && width <= 1024) {
      return DeviceType.tablet; // Tablet
    } else {
      return DeviceType.desktop; // Desktop
    }
  }
}
