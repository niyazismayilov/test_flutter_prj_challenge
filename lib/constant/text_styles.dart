import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:test_prj/constant/colors.dart';

class UITextStyle {

  static TextStyle titleStyle({color = ProjectColor.black}) => const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal);

  static TextStyle subTitleStyle({color = ProjectColor.black}) => const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal);
}
