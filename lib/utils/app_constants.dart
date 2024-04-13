import 'dart:io';

import 'package:flutter/foundation.dart';

/// Created by Vishal Patel
/// Copyright (c) 2021-22. All rights reserved.
/// Company Sdreatech Pvt. Ltd.

class AppConstant {
  static const int pageSize = 10;
  static double imageSize = 250;
  static int requestTime = 220;
  static const String help = "https://www.google.com";
  static const String privacyPolicy = "https://www.google.com";
  static const String legal = "https://www.google.com";
  static const String razorPayImage = "https://i.ibb.co/0cpbGbd/app-icon.png";

  static final bool isWebDesktop = kIsWeb || Platform.isWindows;
  static final double webLogoSize = isWebDesktop ? 0.2 : 0.4;
}
