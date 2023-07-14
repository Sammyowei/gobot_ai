import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomButton extends ConsumerWidget {
  final double? height;
  final double? width;
  final VoidCallback? onTap;
  final Color? buttonColor;
  final Widget? child;
  final BoxBorder? border;

  const CustomButton({
    this.height,
    this.border,
    this.width,
    this.buttonColor,
    this.child,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height?.h ?? 52.h,
        width: width?.w ?? MediaQuery.of(context).size.width.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15).r,
          border: border,
          color: buttonColor,
        ),
        child: Center(child: child),
      ),
    );
  }
}
