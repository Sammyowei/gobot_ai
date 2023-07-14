import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gobot_ai/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/providers.dart';
import '../style/styles.dart';
import '../utils/utils.dart';

class CustomAppBar extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  final Color? color;
  final String botName;

  const CustomAppBar({
    this.color,
    required this.botName,
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends ConsumerState<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    final darkTheme = ref.watch(themeProvider);
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8).w,
      decoration: BoxDecoration(
          color: widget.color,
          border: Border(
            bottom: BorderSide(
              color: CustomAppColors.textFieldColor,
            ),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              offset: const Offset(0, -0.5),
              color: darkTheme
                  ? CustomAppColors.textFieldColor
                  : CustomAppColors.bottomNavLM,
            ),
          ]),
      child: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: SvgPicture.asset(
                AppImage.navBackSvg,
                height: 25.h,
                width: 25.h,
              ),
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 20.r,
                    backgroundColor:
                        CustomAppColors.primaryColor.withOpacity(0.7),
                    child: Image.asset(
                      AppImage.chatbotImage,
                      height: 25.h,
                      width: 25.w,
                    ),
                  ),
                  10.horizontalSpace,
                  CustomText(
                    text: widget.botName,
                    fontSize: 23.sp,
                    fontWeight: FontWeight.w700,
                    textColor: darkTheme
                        ? CustomAppColors.boldTextDarkTheme
                        : CustomAppColors.boldTextLightTheme,
                  ),
                ],
              ),
            ),
            Container(),
            Container()
          ],
        ),
      ),
    );
  }
}
