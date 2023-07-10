import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gobot_ai/providers/theme_provider.dart';
import 'package:gobot_ai/style/styles.dart';
import 'package:gobot_ai/utils/image_path.dart';
import 'package:gobot_ai/widgets/custom_text.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnboardingPageThree extends ConsumerStatefulWidget {
  const OnboardingPageThree({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _OnboardingPageThreeState();
}

class _OnboardingPageThreeState extends ConsumerState<OnboardingPageThree> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = ref.watch(themeProvider);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 60.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // SizedBox(
                  //   height: 100.h,
                  // )

                  Image(
                    height: 214.h,
                    width: 179.w,
                    image: AssetImage(AppImage.onboardingThree),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomText(
                    text: "Your AI Best Friend",
                    fontSize: 42.sp,
                    fontWeight: FontWeight.w800,
                    textAlign: TextAlign.center,
                    textColor: isDarkMode
                        ? CustomAppColors.boldTextDarkTheme
                        : CustomAppColors.boldTextLightTheme,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
