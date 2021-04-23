import 'package:flutter/material.dart';

/// Contains useful consts to reduce boilerplate and duplicate code
class UIHelper {
  // Vertical spacing constants. Adjust to your liking.
  static const double _VerticalSpaceSmall = 10.0;
  static const double _VerticalSpaceMedium = 30.0;
  static const double _VerticalSpaceMediumPlus = 48.0;
  static const double _VerticalSpaceLarge = 60.0;

  // Vertical spacing constants. Adjust to your liking.
  static const double _HorizontalSpaceSmall = 10.0;
  static const double _HorizontalSpaceMedium = 20.0;
  static const double _HorizontalSpaceLarge = 60.0;

  static const Widget verticalSpaceSmall =
      SizedBox(height: _VerticalSpaceSmall);
  static const Widget verticalSpaceMedium =
      SizedBox(height: _VerticalSpaceMedium);
  static const Widget verticalSpaceMediumPlus =
      SizedBox(height: _VerticalSpaceMediumPlus);
  static const Widget verticalSpaceLarge =
      SizedBox(height: _VerticalSpaceLarge);

  static const Widget horizontalSpaceSmall =
      SizedBox(width: _HorizontalSpaceSmall);
  static const Widget horizontalSpaceMedium =
      SizedBox(width: _HorizontalSpaceMedium);
  static const Widget horizontalSpaceLarge =
      SizedBox(width: _HorizontalSpaceLarge);
}

double screenAwareSize(double value, BuildContext context,
    {bool width = false}) {
  if (width) {
    return MediaQuery.of(context).size.width * (value / 414);
  } else {
    return MediaQuery.of(context).size.height * (value / 896);
  }
}

const notificationBellIconAsset =
    AssetImage('assets/images/notification_bell.png');

const handImageAsset = AssetImage('assets/images/hand.png');

const userImageAsset = AssetImage('assets/images/user.png');

const lightningImageAsset = AssetImage('assets/images/lightning.png');

const meterImageAsset = AssetImage('assets/images/meter.png');

const appBGImageAsset = AssetImage('assets/images/appBg.png');

const dashboardImageAsset = AssetImage('assets/images/dashboard.png');
