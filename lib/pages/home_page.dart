import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gobot_ai/models/models.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gobot_ai/providers/providers.dart';
import 'package:gobot_ai/style/styles.dart';

import 'package:gobot_ai/utils/utils.dart';

import '../widgets/widgets.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final greeting = ref.watch(greetingProvider);
    final isDarkMode = ref.watch(themeProvider);

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30).w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              40.verticalSpace,
              CustomText(
                text: greeting,
                fontWeight: FontWeight.w700,
                fontSize: 20.sp,
                textColor: isDarkMode
                    ? CustomAppColors.boldTextDarkTheme
                    : CustomAppColors.boldTextLightTheme,
              ),
              20.verticalSpaceFromWidth,

              
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    "/chat-page",
                    arguments: <String, dynamic>{"name": "Gobot AI", "model": AiBotModels.gobot},
                  );
                },
                child: SizedBox(
                  height: 250.h,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 30,
                        right: 20,
                        bottom: 10,
                        left: 20,
                        child: Container(
                          height: 266.h,
                          width: 268.w,
                          decoration: BoxDecoration(
                            color: isDarkMode
                                ? const Color(0xff1d1d1d).withOpacity(1)
                                : const Color(0xffFFFFFF).withOpacity(1),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                blurStyle: BlurStyle.inner,
                                offset: const Offset(5, 0),
                                color: isDarkMode
                                    ? const Color(0xffAFAFAF).withOpacity(.5)
                                    : const Color(0xffFF3E3F).withOpacity(0.3),
                              ),
                              BoxShadow(
                                blurRadius: 4,
                                blurStyle: BlurStyle.inner,
                                offset: const Offset(0, 0),
                                color: isDarkMode
                                    ? const Color(0xffF6F6F6).withOpacity(0.5)
                                    : const Color(0xffFF3E3F).withOpacity(0.2),
                              ),
                              BoxShadow(
                                blurRadius: 4,
                                blurStyle: BlurStyle.normal,
                                offset: const Offset(0, 4),
                                color: const Color(0xffAFAFAF).withOpacity(.25),
                              ),
                              BoxShadow(
                                blurRadius: 4,
                                blurStyle: BlurStyle.normal,
                                color: isDarkMode
                                    ? const Color(0xff000000).withOpacity(.25)
                                    : const Color(0xffFFFFFF).withOpacity(.25),
                                offset: const Offset(0, -4),
                              ),
                            ],
                          ),
                          child: Center(
                            child: SizedBox(
                              height: 133.h,
                              child: Column(
                                children: [
                                  CustomText(
                                    text: " Hi Samuelson 👋",
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w700,
                                    textColor: isDarkMode
                                        ? const Color(0xffAFAFAF)
                                        : CustomAppColors.boldTextLightTheme
                                            .withOpacity(0.7),
                                  ),
                                  CustomText(
                                    text: "Tap to chat",
                                    fontSize: 30.sp,
                                    fontWeight: FontWeight.w700,
                                    textColor: isDarkMode
                                        ? CustomAppColors.boldTextDarkTheme
                                        : CustomAppColors.boldTextLightTheme,
                                  ),
                                  10.verticalSpace,
                                  Container(
                                    child: SvgPicture.asset(
                                      AppImage.voiceSvg,
                                      color: isDarkMode
                                          ? CustomAppColors.boldTextDarkTheme
                                          : CustomAppColors.boldTextLightTheme,
                                      height: 50.h,
                                      width: 50.w,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              61.verticalSpace,
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "Explore",
                      textColor: isDarkMode
                          ? CustomAppColors.boldTextDarkTheme
                          : CustomAppColors.boldTextLightTheme,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w700,
                    ),
                    Container(
                      child: GestureDetector(
                        onTap: () => ref
                            .read(bottomNavIndexProvider.notifier)
                            .getIndex(1),
                        child: Row(
                          children: [
                            CustomText(
                              text: "see more",
                              textColor: isDarkMode
                                  ? CustomAppColors.primaryColor
                                      .withOpacity(0.7)
                                  : CustomAppColors.primaryColor,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                            ),
                            5.horizontalSpace,
                            SvgPicture.asset(
                              AppImage.navFowardSvg,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              17.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  explore.length,
                  (index) => InkWell(
                    onTap: () {
                      switch (index) {
                        case 0:
                     log(index.toString());
                          log("first button has been clicked");
                          Navigator.pushNamed(context, "/chat-page",  arguments: <String, dynamic>{
                            "name": "BFFFBot"
                          });
                        case 1:
                
                          log("Second button  clicked");
                           Navigator.pushNamed(context, "/chat-page",  arguments: <String, dynamic>{
                            "name": "Q&A"
                          });
                        default:
                          log("page not added.");
                      }
                    },
                    child: explore[index],
                  ),
                ),
              ),
              10.verticalSpace
            ],
          ),
        ),
      ),
    );
  }

  List<BotContainerButton> explore = [
    BotContainerButton(
      imagePath: AppIcons.bfffBot,
      title: "BFFFBot",
      shortDescription: "Friendly and helpful chatbot.",
    ),
    BotContainerButton(
      imagePath: AppIcons.qAndA,
      title: "Q&A",
      forPremium: false,
    ),
  ];
}
