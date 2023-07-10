import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gobot_ai/pages/pages.dart';
import 'package:gobot_ai/providers/onbarding_botton_provider.dart';
import 'package:gobot_ai/style/styles.dart';
import 'package:gobot_ai/widgets/custom_text.dart';
import 'package:gobot_ai/utils/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends ConsumerStatefulWidget {
  const Onboarding({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OnboardingState();
}

class _OnboardingState extends ConsumerState<Onboarding> {
  List<Widget> pages = const [
    OnboardingPageOne(),
    OnboardingPageTwo(),
    OnboardingPageThree()
  ];

  int initialPage = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setStatusBarColor(ref);
  }

  @override
  Widget build(BuildContext context) {
    final pageController = ref.watch(pageControllerProvider);
    final buttonText = ref.watch(buttonTextProvider);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.zero,
              height: size.height,
              width: size.width,
              child: PageView.builder(
                controller: pageController,
                allowImplicitScrolling: true,
                onPageChanged: (value) {
                  ref.read(pageControllerProvider.notifier).moveToPage(value);
                },
                itemCount: pages.length,
                itemBuilder: (context, index) {
                  return pages[index];
                },
              ),
            ),
            Positioned(
              bottom: 150.h,
              left: 130.w,
              right: 130.w,
              child: Container(
                alignment: Alignment(0.0.w, .78.h),
                height: 30.h,
                width: size.width.h * 0.6,
                child: Center(
                  child: SmoothPageIndicator(
                    controller: pageController,
                    count: pages.length,
                    axisDirection: Axis.horizontal,
                    onDotClicked: (index) {
                      ref
                          .read(pageControllerProvider.notifier)
                          .moveToPage(index);
                      (index == 2)
                          ? ref.read(buttonTextProvider.notifier).lastText
                          : ref.read(buttonTextProvider.notifier).firstText;
                    },
                    effect: WormEffect(
                      activeDotColor: CustomAppColors.primaryColor,
                      dotColor: CustomAppColors.primaryColor.withOpacity(.4),
                      paintStyle: PaintingStyle.fill,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 80.h,
              left: 60.w,
              right: 60.w,
              child: InkWell(
                onTap: () {
                  if (buttonText == "Continue") {
                    Navigator.pushNamed(context, "/sign-up");
                  } else {
                    ref.read(pageControllerProvider.notifier).nextPage();
                    final indexFrac = pageController.page;
                    final index = indexFrac?.round();
                    (index == 1)
                        ? ref.read(buttonTextProvider.notifier).lastText
                        : ref.read(buttonTextProvider.notifier).firstText;
                  }
                },
                child: Container(
                  height: 50.h,
                  width: size.width.w,
                  decoration: BoxDecoration(
                    color: CustomAppColors.primaryColor,
                    borderRadius: BorderRadius.circular(15).r,
                  ),
                  child: Center(
                    child: Consumer(builder: (context, ref, child) {
                      final text = ref.watch(buttonTextProvider);
                      return CustomText(
                        text: text,
                        fontWeight: FontWeight.w900,
                        fontSize: 25.sp,
                        textColor: CustomAppColors.boldTextDarkTheme,
                      );
                    }),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // void _setStatusBarColor() {
  //   if (ref.watch(themeProvider.notifier).state == true) {
  //     SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //       statusBarColor: Colors.transparent,
  //       statusBarIconBrightness: Brightness.light,
  //     ));
  //   } else {
  //     SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //       statusBarColor: Colors.transparent,
  //       statusBarIconBrightness: Brightness.dark,
  //     ));
  //   }
  // }
}
