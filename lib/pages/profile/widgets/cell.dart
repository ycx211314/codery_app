import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CellWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? title;
  final Widget? rightWidget;
  final Widget? subtitle;
  final Widget? leftWidget;
  final bool isArrowVisible;
  final double? rightPadding;
  final Color? subtitleColor;
  final double? height;
  final bool? isSeparatorVisible;

  const CellWidget(
      {super.key,
      this.onPressed,
      this.title,
      this.rightWidget,
      this.subtitle,
      this.leftWidget,
      required this.isArrowVisible,
      required this.rightPadding,
      this.subtitleColor,
      this.height,
      this.isSeparatorVisible});
  Widget buildContent(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (leftWidget != null) leftWidget!,
              SizedBox(width: 12.w),
              if (title != null) title!,
              Expanded(
                child: (subtitle != null) ? subtitle! : const SizedBox(),
              ),
              if (rightWidget != null)
                Expanded(
                    child: Align(
                        alignment: Alignment.centerRight, child: rightWidget!)),
              SizedBox(width: isArrowVisible ? 12.w : rightPadding),
              if (isArrowVisible)
                Icon(Icons.arrow_forward_ios,
                    color: Colors.black87, size: 16.sp),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 60.h,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.w)),
          padding: EdgeInsets.fromLTRB(26.w, 0, 12.w, 0), // 设置内边距为0
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                child: buildContent(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
