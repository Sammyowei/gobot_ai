import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gobot_ai/providers/theme_provider.dart';
import 'package:gobot_ai/style/styles.dart';
import 'package:gobot_ai/utils/utils.dart';
import 'package:gobot_ai/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsPAge extends ConsumerStatefulWidget {
  const SettingsPAge({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsPAgeState();
}

class _SettingsPAgeState extends ConsumerState<SettingsPAge> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = ref.watch(themeProvider);
    final kSpacer = 20.verticalSpace;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 10,
              bottom: 10,
            ).w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "Settings",
                        fontSize: 30.sp,
                        fontWeight: FontWeight.w700,
                        textColor: isDarkMode
                            ? CustomAppColors.boldTextDarkTheme
                            : CustomAppColors.boldTextLightTheme,
                      ),
                      Container(
                        child: Row(
                          children: [
                            CustomText(
                              text: "Log out",
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                              textColor: CustomAppColors.primaryColor,
                            ),
                            5.horizontalSpace,
                            SvgPicture.asset(AppIcons.logOut),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                30.verticalSpace,
                Container(
                  child: Row(
                    children: [
                      Container(
                        width: 86.w,
                        height: 82.h,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFFF3E3F),
                          shape: OvalBorder(
                            side: BorderSide(
                              width: 2.50,
                              color:
                                  Colors.white.withOpacity(0.699999988079071),
                            ),
                          ),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            AppIcons.user,
                            height: 55.h,
                            width: 55.w,
                          ),
                        ),
                      ),
                      10.horizontalSpace,
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "SammyOwei",
                              fontWeight: FontWeight.w700,
                              fontSize: 20.sp,
                              textColor: isDarkMode
                                  ? CustomAppColors.boldTextDarkTheme
                                  : CustomAppColors.boldTextLightTheme,
                            ),
                            CustomText(
                              text: "uid:3300948",
                              fontWeight: FontWeight.w700,
                              fontSize: 20.sp,
                              textColor: isDarkMode
                                  ? CustomAppColors.boldTextDarkTheme
                                      .withOpacity(0.7)
                                  : CustomAppColors.boldTextLightTheme
                                      .withOpacity(0.7),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                50.verticalSpace,
                CustomButtonWithTheme(
                  onTap: () {
                    Navigator.pushNamed(context, "/change-password");
                    
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(AppIcons.changePassword),
                      15.horizontalSpace,
                      CustomText(
                        text: "Change Password",
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        textColor: isDarkMode
                            ? CustomAppColors.boldTextDarkTheme.withOpacity(0.8)
                            : CustomAppColors.boldTextLightTheme
                                .withOpacity(0.8),
                      ),
                    ],
                  ),
                ),
                kSpacer,
                CustomButtonWithTheme(
                  forTheme: true,
                  child: Row(
                    children: [
                      SvgPicture.asset(AppIcons.forTheme),
                      15.horizontalSpace,
                      CustomText(
                        text: "Dark mode",
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        textColor: isDarkMode
                            ? CustomAppColors.boldTextDarkTheme.withOpacity(0.8)
                            : CustomAppColors.boldTextLightTheme
                                .withOpacity(0.8),
                      ),
                    ],
                  ),
                ),
                kSpacer,
                CustomButtonWithTheme(
                  child: Row(
                    children: [
                      SvgPicture.asset(AppIcons.subscription),
                      15.horizontalSpace,
                      CustomText(
                        text: "Subscription and Purchases",
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        textColor: isDarkMode
                            ? CustomAppColors.boldTextDarkTheme.withOpacity(0.8)
                            : CustomAppColors.boldTextLightTheme
                                .withOpacity(0.8),
                      ),
                    ],
                  ),
                ),
                kSpacer,
                CustomButtonWithTheme(
                  child: Row(
                    children: [
                      SvgPicture.asset(AppIcons.changePassword),
                      15.horizontalSpace,
                      CustomText(
                        text: "Terms and Conditions",
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        textColor: isDarkMode
                            ? CustomAppColors.boldTextDarkTheme.withOpacity(0.8)
                            : CustomAppColors.boldTextLightTheme
                                .withOpacity(0.8),
                      ),
                    ],
                  ),
                ),
                kSpacer,
                kSpacer,
                kSpacer,
                Container(
                  child: Center(
                    child: CustomText(
                      text: "Gobot AI 2.0.0",
                      fontWeight: FontWeight.w700,
                      fontSize: 15.sp,
                      textColor: isDarkMode
                          ? const Color(0x7FAFAFAF)
                          : const Color(0x7FAFAFAF),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
