import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gobot_ai/style/app_colors.dart';
import 'package:gobot_ai/utils/utils.dart';
import 'package:gobot_ai/widgets/custom_text.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(
        seconds: 3,
      ),
      () => Navigator.pushNamedAndRemoveUntil(
        context,
        "/onboarding",
        (route) => false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            180.verticalSpace,
            SizedBox(
              height: 270.h,
              child: Column(
                children: [
                  Center(
                    child: SvgPicture.asset(
                      AppImage.logo,
                      height: 190.h,
                      width: 210.w,
                      color: CustomAppColors.primaryColor,
                    ),
                  ),
                  10.verticalSpace,
                  CustomText(
                    text: "Gobot AI",
                    textColor: CustomAppColors.primaryColor,
                    fontWeight: FontWeight.w900,
                    fontSize: 50.sp,
                  )
                ],
              ),
            ),
            200.verticalSpace,
            CustomText(
              text: "Version 2.0.0",
              textColor: CustomAppColors.versionNameColorLM,
              fontWeight: FontWeight.w900,
              fontSize: 18.sp,
            ),
          ],
        ),
      ),
    );
  }
}
