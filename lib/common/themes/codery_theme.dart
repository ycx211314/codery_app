import 'package:codery/common/utils/color_helper.dart';
import 'package:flutter/material.dart';

final Color primaryColor = ColorHelper.hexToColor("#409EFF");
final Color secondaryLightColor = ColorHelper.hexToColor("#909399");

final Color primaryTextColor = ColorHelper.hexToColor("#303133");
final Color regularTextColor = ColorHelper.hexToColor("#606266");
final Color secondaryTextColor = ColorHelper.hexToColor("#909399");
final Color placeholderTextColor = ColorHelper.hexToColor("#C0C4CC");

final Color backgroundColorW = ColorHelper.hexToColor("#FFFFFF");

final Color borderBaseColor = ColorHelper.hexToColor("#DCDFE6");
final Color borderLightColor = ColorHelper.hexToColor("#E4E7ED");
final Color borderLighterColor = ColorHelper.hexToColor("#EBEEF5");
final Color borderExtraLightColor = ColorHelper.hexToColor("#F2F6FC");

ThemeData coderyTheme = ThemeData(
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: primaryColor,
      unselectedItemColor: secondaryLightColor,
      selectedIconTheme: IconThemeData(color: primaryColor),
      unselectedIconTheme: IconThemeData(color: secondaryLightColor)),
  filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
    shape:
        WidgetStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0), // 设置圆角半径
    )),
    backgroundColor: WidgetStateProperty.all<Color>(primaryColor),
  )),
);
