import 'package:codery/common/utils/color_helper.dart';
import 'package:flutter/material.dart';

final Color primaryColor = ColorHelper.hexToColor("#53B175");
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

final Color dividerThemeColor = ColorHelper.hexToColor("#E2E2E2");

ThemeData coderyTheme = ThemeData(
  dividerTheme: DividerThemeData(color: dividerThemeColor),
  primaryColor: primaryColor,
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
  appBarTheme: const AppBarTheme(
    shadowColor: Colors.black,
  ),
  colorScheme: ColorScheme(
    primary: primaryColor,
    onPrimary: Colors.white,
    secondary: Colors.green,
    onSecondary: Colors.white,
    surface: Colors.white,
    onSurface: Colors.black,
    error: Colors.red,
    onError: Colors.white, brightness: Brightness.light,
    // 可以添加更多颜色，如onBackground、onErrorContainer等
  ),
);
