import 'package:flutter/material.dart';

enum ScreenDevice {
  mobile,
  tablet,
  desktop,
  widescreen,
  fullhd,
}

/// Reference: https://bulma.io/documentation/overview/responsiveness/
class ScreenSizeUtil {
  static double mobile = 450;
  static double tablet = 769;
  static double desktop = 1024;
  static double widescreen = 1216;
  static double fullhd = 1408;

  /// Get screen device type
  static ScreenDevice getScreenDevice(BuildContext context) {
    var device = ScreenDevice.desktop;
    if (onlyMobile(context)) {
      ;
      device = ScreenDevice.mobile;
    }
    if (onlyTablet(context)) {
      device = ScreenDevice.tablet;
    }
    if (onlyDesktop(context)) {
      device = ScreenDevice.desktop;
    }
    if (onlyWidescreen(context)) {
      device = ScreenDevice.widescreen;
    }
    if (overFullhd(context)) {
      device = ScreenDevice.fullhd;
    }
    return device;
  }

  /// Get mapped data by device
  static dynamic getValueByScreenDevice<T>(
    BuildContext context, {
    T? mobile,
    T? tablet,
    T? desktop,
    T? widescreen,
    T? fullhd,
    T? default_value,
  }) {
    final device = getScreenDevice(context);
    switch (device) {
      case ScreenDevice.mobile:
        return mobile;
      case ScreenDevice.tablet:
        return tablet;
      case ScreenDevice.desktop:
        return desktop;
      case ScreenDevice.widescreen:
        return widescreen;
      case ScreenDevice.fullhd:
        return fullhd;
      default:
        return default_value;
    }
  }

  /// Cover bigger screen than tablet
  static bool overTablet(BuildContext context) {
    return MediaQuery.of(context).size.width >= tablet;
  }

  /// Cover bigger screen than desktop
  static bool overDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= desktop;
  }

  /// Cover bigger screen than wide screen
  static bool overWidescreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= widescreen;
  }

  /// Cover bigger screen than FHD screen
  static bool overFullhd(BuildContext context) {
    return MediaQuery.of(context).size.width >= fullhd;
  }

  /// Cover only mobile screen
  static bool onlyMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < tablet;
  }

  /// Cover only tablet screen
  static bool onlyTablet(BuildContext context) {
    return MediaQuery.of(context).size.width >= tablet;
  }

  /// Cover only mobile and table screen
  static bool onlyTouch(BuildContext context) {
    return MediaQuery.of(context).size.width <= tablet;
  }

  /// Cover only desktop screen
  static bool onlyDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= desktop;
  }

  /// Cover only wide screen
  static bool onlyWidescreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= desktop;
  }
}
