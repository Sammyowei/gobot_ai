import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gobot_ai/providers/theme_provider.dart';
import 'package:gobot_ai/utils/status_bar.dart';
import 'package:gobot_ai/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomButtonWithTheme extends ConsumerWidget {
  final Widget? child;
  final String? iconPath;
  final bool forTheme;
  final double? width;
  final double? height;
  final VoidCallback? onTap;
  const CustomButtonWithTheme({
    this.width,
    this.height,
    this.onTap,
    this.iconPath,
    this.forTheme = false,
    this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeProvider);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 353.w,
        height: height ?? 82.h,
        padding: const EdgeInsets.only(left: 15, right: 15).w,
        decoration: ShapeDecoration(
          color: isDarkMode ? const Color(0x33AFAFAF) : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 9,
              offset: Offset(0, 4),
              spreadRadius: 0,
            ),
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 9,
              offset: Offset(0, -4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              child ?? const CustomText(text: "Theme Button"),
              forTheme
                  ? Switch(
                      value: isDarkMode,
                      onChanged: (value) {
                        ref.read(themeProvider.notifier).themeValue(value);
                        setStatusBarColor(ref);
                      },
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
