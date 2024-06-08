import 'dart:ui';

class ColorHelper {
//静态方法将16进制颜色转换为Color对象
  static Color hexToColor(String hex) {
    return Color(int.parse(hex.replaceAll('#', '0xff')));
  }
}
