import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gobot_ai/providers/theme_provider.dart';
import 'package:gobot_ai/style/app_colors.dart';

import 'package:gobot_ai/utils/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../widgets/widgets.dart';

class ForgotPasswordPage extends ConsumerStatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends ConsumerState<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final kSpacer = 25.verticalSpace;
    final isDarkMode = ref.watch(themeProvider);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
            ).w,
            child: Column(
              children: [
                SizedBox(
                  width: size.width.w,
                  height: 52.h,
                  child: Row(
                    children: [
                      GestureDetector(
                        child: SvgPicture.asset(
                          AppImage.navBackSvg,
                          color: CustomAppColors.primaryColor,
                          height: 35.h,
                        ),
                      ),
                      15.horizontalSpace,
                      CustomText(
                        text: "Forgot Password",
                        fontSize: 30.sp,
                        fontWeight: FontWeight.w700,
                        textColor: isDarkMode
                            ? CustomAppColors.boldTextDarkTheme
                            : CustomAppColors.boldTextLightTheme,
                      )
                    ],
                  ),
                ),
                30.verticalSpace,
                Container(
                  height: size.height.h,
                  width: size.width.w,
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ).w,
                  child: Column(
                    children: [
                      CustomText(
                        text:
                            "please  enter  your registered email address to receive your password reset link.",
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.center,
                        textColor: isDarkMode
                            ? CustomAppColors.buttonColorDm
                            : CustomAppColors.buttonColorLm,
                      ),
                      40.verticalSpace,
                      const CustomTextField(
                        hintText: "enter your email",
                      ),
                      kSpacer,
                      CustomButton(
                        height: 52.sp,
                        buttonColor: CustomAppColors.primaryColor,
                        child: CustomText(
                            text: "Continue",
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w700,
                            textColor: CustomAppColors.boldTextDarkTheme),
                      ),
                      53.verticalSpace,
                      SizedBox(
                        width: size.width.w,
                        height: 30.h,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Row(
                                children: [
                                  CustomText(
                                    text: "Remember your password?",
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                    textColor: isDarkMode
                                        ? CustomAppColors.boldTextDarkTheme
                                        : CustomAppColors.boldTextLightTheme,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  GestureDetector(
                                    onTap: () => Navigator.of(context)
                                        .pushNamed("/log-in"),
                                    child: CustomText(
                                      text: "Log in",
                                      fontSize: 18.sp,
                                      textColor: CustomAppColors.primaryColor,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
