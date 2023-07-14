import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/providers.dart';
import '../style/styles.dart';
import '../utils/utils.dart';

class CustomChatTextField extends ConsumerWidget {
  final TextEditingController? controller;
  const CustomChatTextField({this.controller, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeProvider);
    final isTyping = ref.watch(isTypingProvider);
    return Container(
      padding: const EdgeInsets.only(top: 8, left: 20, right: 20, bottom: 8).w,
      color: isDarkMode ? CustomAppColors.darkMode : CustomAppColors.lightMode,
      width: MediaQuery.of(context).size.width,
      height: 80.h,
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container();
                  },
                );
              },
              child: Container(
                child: Center(
                  child: SvgPicture.asset(
                    AppIcons.recorder,
                    height: 25.h,
                    width: 25.w,
                    color: CustomAppColors.primaryColor,
                  ),
                ),
              ),
            ),
            10.horizontalSpace,
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(
                  left: 12,
                  right: 12,
                ).w,
                decoration: ShapeDecoration(
                  color: isDarkMode
                      ? const Color(0x33FCFCFC)
                      : const Color(0xFFD9D9D9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30).r,
                  ),
                ),
                child: TextFormField(
                  controller: controller,
                  minLines: 1,
                  keyboardType: TextInputType.multiline,
                  cursorColor: CustomAppColors.primaryColor,
                  onChanged: (value) {
                    (value.isEmpty)
                        ? ref.read(isTypingProvider.notifier).isNotTyping
                        : ref.read(isTypingProvider.notifier).isNowTyping;
                  },
                  style: GoogleFonts.nunito(
                    color: isDarkMode
                        ? CustomAppColors.boldTextDarkTheme
                        : CustomAppColors.boldTextLightTheme,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter your prompt.",
                    hintStyle: GoogleFonts.nunito(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: isDarkMode
                          ? Colors.white.withOpacity(0.6000000238418579)
                          : Colors.black.withOpacity(0.6000000238418579),
                    ),
                  ),
                ),
              ),
            ),
            10.horizontalSpace,
            isTyping
                ? GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 35.w,
                      height: 35.h,
                      decoration: ShapeDecoration(
                          color: const Color(0xFFFF3E3F),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12).r,
                          )),
                      child: Center(
                        child: SvgPicture.asset(
                          AppIcons.send,
                          height: 25.h,
                          width: 25.w,
                          color: CustomAppColors.boldTextDarkTheme,
                        ),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
