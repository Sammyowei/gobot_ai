import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gobot_ai/providers/theme_provider.dart';
import 'package:gobot_ai/style/styles.dart';
import 'package:gobot_ai/utils/utils.dart';
import 'package:gobot_ai/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChangePassword extends ConsumerStatefulWidget {
  const ChangePassword({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends ConsumerState<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = ref.read(themeProvider);
    final kSpacer = 20.verticalSpace;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Column(
            children: [
              Container(
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: SvgPicture.asset(AppImage.navBackSvg),
                    ),
                    29.horizontalSpace,
                    CustomText(
                      text: "Change password",
                      fontSize: 27.sp,
                      fontWeight: FontWeight.w700,
                      textColor: isDarkMode
                          ? CustomAppColors.boldTextDarkTheme
                          : CustomAppColors.boldTextLightTheme,
                    )
                  ],
                ),
              ),
              25.verticalSpace,
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Center(
                  child: CustomText(
                    text:
                        "Secure  your account with a new password. Choose a strong and unique combination to protect your personal information",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center,
                    textColor: isDarkMode
                        ? CustomAppColors.boldTextDarkTheme.withOpacity(0.8)
                        : CustomAppColors.boldTextLightTheme.withOpacity(0.8),
                  ),
                ),
              ),
              34.verticalSpace,
              const CustomTextField(
                hintText: "Enter your password",
              ),
              kSpacer,
              const CustomTextField(
                hintText: "Enter new password",
              ),
              kSpacer,
              const CustomTextField(
                hintText: "Confirm new password",
              ),
              45.verticalSpace,
              CustomButton(
                buttonColor: CustomAppColors.primaryColor,
                child: CustomText(
                  text: "Change password",
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w700,
                  textColor: CustomAppColors.boldTextDarkTheme,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
