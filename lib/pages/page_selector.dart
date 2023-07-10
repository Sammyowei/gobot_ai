import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gobot_ai/providers/providers.dart';
import 'package:gobot_ai/style/styles.dart';

import 'package:gobot_ai/utils/utils.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'pages.dart';

class PageSelector extends ConsumerStatefulWidget {
  const PageSelector({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PageSelectorState();
}

class _PageSelectorState extends ConsumerState<PageSelector> {
  List<Widget> pages = const [
    HomePage(),
    ExplorePage(),
    SettingsPAge(),
  ];
  @override
  Widget build(BuildContext context) {
    final pageController = ref.watch(pageSellectorProvider);
    Size size = MediaQuery.of(context).size;

    final isDarkMode = ref.watch(themeProvider);
    final currentIndex = ref.watch(bottomNavIndexProvider);
    return Scaffold(
      body: PageView.builder(
        itemCount: pages.length,
        controller: pageController,
        onPageChanged: (value) {
          ref.read(bottomNavIndexProvider.notifier).getIndex(value);
        },
        itemBuilder: (context, index) {
          return pages[index];
        },
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(20),
        height: 66.h,
        decoration: BoxDecoration(
          color: isDarkMode
              ? const Color(0xffFCFCFC).withOpacity(0.2)
              : const Color(0xffF4F4F4),
          borderRadius: BorderRadius.circular(50).r,
          boxShadow: [
            BoxShadow(
              color: isDarkMode
                  ? const Color(0xffFFFFFF).withOpacity(.09)
                  : const Color(0xff000000).withOpacity(.25),
              blurRadius: 30,
              offset: const Offset(0, 10),
            )
          ],
        ),
        child: ListView.builder(
          itemCount: 3,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: size.width * .024).w,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              ref.read(bottomNavIndexProvider.notifier).getIndex(index);
              ref.read(pageSellectorProvider.notifier).moveToNextPage(index);
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(8).w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  6.5.horizontalSpace,
                  // AnimatedContainer(
                  //   duration: Duration(milliseconds: 1500),
                  //   curve: Curves.fastLinearToSlowEaseIn,
                  //   margin: EdgeInsets.only(
                  //     bottom: index == currentIndex ? size.width * 0.014 : 0,
                  //   ),
                  //   decoration: BoxDecoration(
                  //     color: Colors.blueAccent,
                  //     borderRadius: BorderRadius.vertical(
                  //       bottom: Radius.circular(10),
                  //     ),
                  //   ),
                  // ),

                  Padding(
                    padding: const EdgeInsets.only(right: 85).w,
                    child: SvgPicture.asset(
                      listOfSvgIcons[index],
                      color: index == currentIndex
                          ? CustomAppColors.primaryColor
                          : CustomAppColors.bottomNavItemColor,
                      width: size.width.w * 0.076.w,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<String> listOfSvgIcons = [
    AppImage.homeSvg,
    AppImage.exploreSvg,
    AppImage.settingsSvg,
  ];

  void _checkDirectoryPermission() async {
    final recordingDirectory =
        await RecordingDirectoryManager().createDirectory();
    recordingDirectory;
    await RecordingDirectoryManager().checkAndCreateDirectory();
  }

  @override
  void initState() {
    Future.delayed(
      const Duration(
        milliseconds: 500,
      ),
      () => ref.read(greetingProvider.notifier).greeting,
    );
    super.initState();
    _checkDirectoryPermission();
  }

  @override
  void didChangeDependencies() {
    setStatusBarColor(ref);
    super.didChangeDependencies();
  }
}
