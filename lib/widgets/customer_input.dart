import 'package:codery/common/utils/color_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomerInputWidget extends StatefulWidget {
  final TextEditingController textEditingController;
  final String? hintText;
  final String? helperText;
  final String? Function(String?) validator;
  final IconData? icon;
  final TextInputType? textInputType;
  bool? obscureText;

  CustomerInputWidget({
    super.key,
    required this.textEditingController,
    this.hintText,
    this.helperText,
    required this.validator,
    this.icon,
    this.textInputType,
    this.obscureText,
  });

  @override
  _CustomerInputWidgetState createState() => _CustomerInputWidgetState();
}

class _CustomerInputWidgetState extends State<CustomerInputWidget> {
  late Color defaultColor;
  late Color hintColor;
  late Color activitedColor;
  late Color borderColor;
  late Color iconColor;
  final FocusNode _focusNode = FocusNode();
  bool suffixShow = false;

  @override
  void initState() {
    super.initState();
    defaultColor = ColorHelper.hexToColor("#9098B1");
    hintColor = ColorHelper.hexToColor("#9098B1");
    activitedColor = ColorHelper.hexToColor("#40BFFF");
    borderColor = ColorHelper.hexToColor("#EBF0FF");
    iconColor = defaultColor;
    if (widget.obscureText == null) {
      suffixShow = false;
    } else if (widget.obscureText == true) {
      suffixShow = true;
    } else {
      suffixShow = false;
    }
    _focusNode.addListener(() {
      setState(() {
        iconColor = _focusNode.hasFocus ? activitedColor : defaultColor;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Icon? prefixIcon;
    if (widget.icon != null) {
      prefixIcon = Icon(
        widget.icon!,
        size: 18.sp,
      );
    }
    return Container(
      color: Colors.white,
      child: TextFormField(
        obscureText: widget.obscureText ?? false,
        controller: widget.textEditingController,
        focusNode: _focusNode,
        keyboardType: widget.textInputType,
        validator: widget.validator,
        style: TextStyle(fontSize: 12.sp, color: defaultColor),
        decoration: InputDecoration(
          hintText: widget.hintText,
          helperText: widget.helperText,
          hintStyle: TextStyle(color: hintColor, fontSize: 12.sp),
          prefixIcon: prefixIcon,
          suffixIcon: suffixShow
              ? IconButton(
                  icon: Icon(
                    Icons.visibility,
                    color: iconColor,
                    size: 18.sp,
                  ),
                  onPressed: () {
                    setState(() {
                      setState(() {
                        widget.obscureText = !widget.obscureText!;
                      });
                    });
                  },
                )
              : null,
          border:
              OutlineInputBorder(borderSide: BorderSide(color: borderColor)),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: activitedColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: activitedColor),
          ),
          errorStyle: const TextStyle(height: 0),
          contentPadding: EdgeInsets.symmetric(vertical: 16.h),
        ),
      ),
    );
  }
}
