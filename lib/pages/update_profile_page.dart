import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gobot_ai/providers/mobile_text_field._provider.dart';
import 'package:gobot_ai/providers/theme_provider.dart';
import 'package:gobot_ai/style/styles.dart';
import 'package:gobot_ai/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UpdateProfilePage extends ConsumerStatefulWidget {
  const UpdateProfilePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UpdateProfilePageState();
}

class _UpdateProfilePageState extends ConsumerState<UpdateProfilePage> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = ref.watch(themeProvider);
    final kSpacer = 20.verticalSpace;
    final countryNameController = ref.watch(countryNameProvider);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 30,
            right: 30,
          ).w,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                30.verticalSpace,
                CustomText(
                  fontSize: 30.sp,
                  text: "Profile",
                  fontWeight: FontWeight.w700,
                  textColor: isDarkMode
                      ? CustomAppColors.boldTextDarkTheme
                      : CustomAppColors.boldTextLightTheme,
                ),
                60.verticalSpace,
                CustomText(
                  fontSize: 20.sp,
                  text: "Update your Gobot AI profile",
                  fontWeight: FontWeight.w500,
                  textColor: isDarkMode
                      ? CustomAppColors.boldTextDarkTheme.withOpacity(0.8)
                      : CustomAppColors.boldTextLightTheme.withOpacity(.8),
                ),
                25.verticalSpace,
                const CustomTextField(
                  hintText: "enter your full name",
                ),
                kSpacer,
                const CustomTextField(
                  hintText: "enter your user name",
                ),
                kSpacer,
                const CustomTextField(
                  forMobile: true,
                  hintText: "enter mobile number",
                ),
                kSpacer,
                CustomTextField(
                  textEditingController: countryNameController,
                  hintText: "enter your country",
                ),
                35.verticalSpace,
                Container(
                  child: Center(
                    child: CustomButton(
                      onTap: () {
                        Navigator.of(context).pushNamed("/home");
                      },
                      buttonColor: CustomAppColors.primaryColor,
                      child: CustomText(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w700,
                        textColor: CustomAppColors.boldTextDarkTheme,
                        text: "Continue",
                      ),
                    ),
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
