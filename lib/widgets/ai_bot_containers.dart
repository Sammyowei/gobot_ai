import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gobot_ai/providers/theme_provider.dart';
import 'package:gobot_ai/style/styles.dart';
import 'package:gobot_ai/utils/utils.dart';
import 'package:gobot_ai/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BotContainerButton extends ConsumerWidget {
  final double? height;
  final bool forPremium;
  final double? width;
  final String? title;
  final String? shortDescription;
  final String? imagePath;
  final VoidCallback? onTap;
  const BotContainerButton({
    this.forPremium = false,
    this.height,
    this.width,
    this.title,
    this.shortDescription,
    this.imagePath,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeProvider);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width?.w ?? 154.w,
        height: height?.h ?? 195.h,
        padding: const EdgeInsets.only(left: 11, right: 11, top: 10, bottom: 7)
            .flipped,
        decoration: ShapeDecoration(
          shadows: [
            BoxShadow(
              color: const Color(0x3F000000).withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 4),
              spreadRadius: 0,
            ),
            BoxShadow(
              color: const Color(0x3F000000).withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(4, 0),
              spreadRadius: 2,
            ),
          ],
          color: isDarkMode
              ? const Color(0x33AFAFAF)
              : Colors.white.withOpacity(1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20).r,
            side: BorderSide.none,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    imagePath ?? AppImage.navBackSvg,
                    height: 45.h,
                    width: 45.w,
                  ),
                  forPremium
                      ? SvgPicture.asset(
                          AppIcons.premium,
                          height: 25.h,
                          width: 25.w,
                        )
                      : Container(),
                ],
              ),
            ),
            10.verticalSpace,
            CustomText(
              text: title ?? "title",
              textColor: isDarkMode
                  ? CustomAppColors.boldTextDarkTheme
                  : CustomAppColors.boldTextLightTheme,
              fontWeight: FontWeight.w700,
              fontSize: 25.sp,
            ),
            3.verticalSpace,
            CustomText(
              text: shortDescription ??
                  "Answers question based on existing knowledge",
              fontSize: 14.50.sp,
              fontWeight: FontWeight.w700,
              textColor: isDarkMode
                  ? const Color(0xffafafaf)
                  : const Color(0xBF1D1D1D),
              textAlign: TextAlign.start,
            )
          ],
        ),
      ),
    );
  }
}
