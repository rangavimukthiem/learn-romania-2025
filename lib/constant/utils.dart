import 'package:flutter/widgets.dart';

// ignore: constant_identifier_names
enum DeviceType { Mobile, Tablet, Desktop }

/// Utility for screen-related calculations.
class ScreenUtils {
  /// Returns the screen width.
  ///
  ///
  ///

  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /// Returns the screen height.
  static double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  /// Returns the aspect ratio.
  static double getAspectRatio(BuildContext context) {
    return MediaQuery.of(context).size.aspectRatio;
  }

  static double getSize(BuildContext context, double value) {
    double ScreenWidth = MediaQuery.of(context).size.width;

    if (getDeviceType(context) == DeviceType.Mobile) {
      // print(">>>>>>>>>>>>>>>>>> device type is Mobile");
      return (1920 / 100) * value * 1;
    } else if (getDeviceType(context) == DeviceType.Tablet) {
      // print(">>>>>>>>>>>>>>>>>> device type is tablet");
      return (1920 / 100) * value * 1;
    } else if (getDeviceType(context) == DeviceType.Desktop) {
      // print(">>>>>>>>>>>>>>>>>> device type is Desktop");
      return (1920 / 100) * value * 1.5;
    } else {
      print(">>>>>>>>>>>>>>>>>> device type is unknows rendering as mobile");
      return ScreenWidth * value;
    }
  }
}

DeviceType getDeviceType(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  if (width >= 1200) return DeviceType.Desktop;
  if (width >= 600) return DeviceType.Tablet;
  return DeviceType.Mobile;
}
