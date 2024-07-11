String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your email';
  }
  // 正则表达式匹配电子邮件格式
  final RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  if (!emailRegExp.hasMatch(value)) {
    return 'Please enter a valid email';
  }

  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your password';
  }

  // 检查密码长度
  if (value.length < 6) {
    return 'Password must be at least 6 characters';
  }

  // 检查密码是否包含至少一个大写字母、一个小写字母和一个数字
  final RegExp uppercaseRegExp = RegExp(r'[A-Z]');
  final RegExp lowercaseRegExp = RegExp(r'[a-z]');
  final RegExp digitRegExp = RegExp(r'\d');

  if (!uppercaseRegExp.hasMatch(value) ||
      !lowercaseRegExp.hasMatch(value) ||
      !digitRegExp.hasMatch(value)) {
    return 'Password must contain at least one uppercase letter, one lowercase letter, and one digit';
  }

  return null;
}

String? validateRepeatPassword(String? value, String? value1) {
  if (value == null || value.isEmpty) {
    return 'Please enter your password';
  }

  // 检查密码长度
  if (value.length < 6) {
    return 'Password must be at least 6 characters';
  }

  // 检查密码是否包含至少一个大写字母、一个小写字母和一个数字
  final RegExp uppercaseRegExp = RegExp(r'[A-Z]');
  final RegExp lowercaseRegExp = RegExp(r'[a-z]');
  final RegExp digitRegExp = RegExp(r'\d');

  if (!uppercaseRegExp.hasMatch(value) ||
      !lowercaseRegExp.hasMatch(value) ||
      !digitRegExp.hasMatch(value)) {
    return 'Password must contain at least one uppercase letter, one lowercase letter, and one digit';
  }

  if (value != value1) {
    return 'The passwords do not match';
  }
  return null;
}
