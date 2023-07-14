import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gobot_ai/providers/theme_provider.dart';
import 'package:gobot_ai/style/styles.dart';

import 'package:gobot_ai/utils/utils.dart';
import 'package:gobot_ai/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setStatusBarColor(ref);
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMede = ref.watch(themeProvider);
    final size = MediaQuery.of(context).size;

    const kSpacer = SizedBox(
      height: 20,
    );
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 32,
              right: 33,
            ).r,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const SizedBox(
                //   height: 30,
                // ),
                30.verticalSpace,
                InkWell(
                  onTap: () {
                    ref.read(themeProvider.notifier).tuggleThemes;
                    setStatusBarColor(ref);
                  },
                  child: Container(
                    padding: EdgeInsets.zero,
                    width: size.width.w,
                    height: 219.h,
                    child: Image(
                      width: 144.w,
                      image: AssetImage(AppImage.onboardingOne),
                    ),
                  ),
                ),
                16.verticalSpace,
                CustomText(
                  text: "Hi there,",
                  fontWeight: FontWeight.w700,
                  fontSize: 30.sp,
                  textColor: isDarkMede
                      ? CustomAppColors.boldTextDarkTheme
                      : CustomAppColors.boldTextLightTheme,
                ),
                // const SizedBox(
                //   height: 15,
                // ),
                15.verticalSpace,

                const CustomTextField(
                  hintText: "enter your email",
                ),
                kSpacer,
                const CustomTextField(
                  forPassword: true,
                  hintText: "enter your password",
                ),
                kSpacer,
                const CustomTextField(
                  forPassword: true,
                  hintText: "confirm your password",
                ),
                // const SizedBox(
                //   height: 46,
                // ),

                46.verticalSpace,
                CustomButton(
                  onTap: () {
                    Navigator.of(context)
                        .restorablePushNamed("/update-profile");
                  },
                  buttonColor: CustomAppColors.primaryColor,
                  child: CustomText(
                    text: "Register",
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w800,
                    textColor: CustomAppColors.bottonTextColor,
                  ),
                ),
                // const SizedBox(
                //   height: 10,
                // ),

                10.verticalSpace,
                Container(
                  padding: EdgeInsets.zero,
                  width: size.width,
                  child: Center(
                    child: CustomText(
                      text: "or",
                      fontWeight: FontWeight.w700,
                      fontSize: 20.sp,
                      textColor: isDarkMede
                          ? CustomAppColors.boldTextDarkTheme.withOpacity(.7)
                          : CustomAppColors.boldTextLightTheme.withOpacity(.7),
                    ),
                  ),
                ),
                // const SizedBox(
                //   height: 8,
                // ),
                8.verticalSpace,
                CustomButton(
                  buttonColor: CustomAppColors.buttonColor,
                  border: Border.all(
                    width: 2.r,
                    color: CustomAppColors.borderColor,
                    style: BorderStyle.solid,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only().w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: SvgPicture.asset(
                            AppImage.googleLogoSvg,
                            height: 30.h,
                            width: 30.w,
                          ),
                        ),
                        // const SizedBox(
                        //   width: 7,
                        // ),
                        7.horizontalSpace,
                        CustomText(
                          text: "Continue with Google",
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w800,
                          textColor: isDarkMede
                              ? CustomAppColors.buttonColorDm
                              : CustomAppColors.buttonColorLm,
                        ),
                      ],
                    ),
                  ),
                ),
                kSpacer,
                Platform.isIOS
                    ? CustomButton(
                        height: 52.h,
                        buttonColor: CustomAppColors.buttonColor,
                        border: Border.all(
                          width: 2.w,
                          color: CustomAppColors.borderColor,
                          style: BorderStyle.solid,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 39,
                          ).w,
                          child: Row(
                            children: [
                              Container(
                                child: SvgPicture.asset(
                                  isDarkMede
                                      ? AppImage.appleLogoDmSvg
                                      : AppImage.appleLogoLmSvg,
                                ),
                              ),
                              // const SizedBox(
                              //   width: 7,
                              // ),

                              7.horizontalSpace,
                              CustomText(
                                text: "Continue with Apple",
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w800,
                                textColor: isDarkMede
                                    ? CustomAppColors.buttonColorDm
                                    : CustomAppColors.buttonColorLm,
                              ),
                            ],
                          ),
                        ),
                      )
                    : Container(),
                // const SizedBox(
                //   height: 40,
                // ),
                40.verticalSpace,
                SizedBox(
                  width: size.width,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Row(
                          children: [
                            CustomText(
                              text: "Already have an account?",
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              textColor: isDarkMede
                                  ? CustomAppColors.boldTextDarkTheme
                                  : CustomAppColors.boldTextLightTheme,
                            ),
                            // const SizedBox(
                            //   width: 5,
                            // ),\
                            5.horizontalSpace,
                            GestureDetector(
                              onTap: () =>
                                  Navigator.of(context).pushNamed("/log-in"),
                              child: CustomText(
                                text: "Log in",
                                fontSize: 18.sp,
                                textColor: CustomAppColors.primaryColor,
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 60,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
