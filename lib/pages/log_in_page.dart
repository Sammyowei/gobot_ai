import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gobot_ai/providers/theme_provider.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../style/styles.dart';
import '../utils/utils.dart';
import '../widgets/widgets.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setStatusBarColor(ref);
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMede = ref.watch(themeProvider);
    final size = MediaQuery.of(context).size;

    final kSpacer = 20.verticalSpace;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 33,
            right: 33,
          ).w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              30.verticalSpace,
              InkWell(
                onTap: () {
                  ref.read(themeProvider.notifier).tuggleThemes;
                  setStatusBarColor(ref);
                },
                child: Container(
                  padding: EdgeInsets.zero,
                  width: size.width,
                  height: 219,
                  child: Image(
                    width: 144,
                    image: AssetImage(AppImage.onboardingThree),
                  ),
                ),
              ),
              // const SizedBox(
              //   height: 16,
              // ),
              16.verticalSpace,
              CustomText(
                text: "Welcome back,",
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
              // const SizedBox(
              //   height: 10,
              // ),
              10.verticalSpace,
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () =>
                          Navigator.of(context).pushNamed("/forgot-password"),
                      child: CustomText(
                        text: "Forgot password?",
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        textColor: CustomAppColors.primaryColor,
                      ),
                    )
                  ],
                ),
              ),
              // const SizedBox(
              //   height: 46,
              // ),
              46.verticalSpace,
              CustomButton(
                onTap: () {
                  print("button Has been clicked");
                },
                height: 50,
                // width: 328.w,
                buttonColor: CustomAppColors.primaryColor,
                child: CustomText(
                  text: "Log in",
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
                width: size.width.w,
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
                height: 50,
                buttonColor: CustomAppColors.buttonColor,
                border: Border.all(
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
                        child: SvgPicture.asset(AppImage.googleLogoSvg,
                            height: 30.h),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
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
                      height: 60.h,
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
                            text: "Don’t have an account?",
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            textColor: isDarkMede
                                ? CustomAppColors.boldTextDarkTheme
                                : CustomAppColors.boldTextLightTheme,
                          ),
                          // const SizedBox(
                          //   width: 5,
                          // ),
                          5.horizontalSpace,
                          GestureDetector(
                            onTap: () =>
                                Navigator.of(context).pushNamed("/sign-up"),
                            child: CustomText(
                              text: "create one",
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
              16.verticalSpace,
            ],
          ),
        ),
      )),
    );
  }
}
