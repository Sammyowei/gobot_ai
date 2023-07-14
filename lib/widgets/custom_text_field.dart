import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gobot_ai/style/styles.dart';
import 'package:gobot_ai/utils/image_path.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart' as flc;

import '../providers/providers.dart';

class CustomTextField extends ConsumerStatefulWidget {
  final String? hintText;
  final bool forPassword;
  final bool forMobile;

  final TextEditingController? textEditingController;
  final String? Function(String?)? validator;

  const CustomTextField({
    this.validator,
    this.textEditingController,
    this.forMobile = false,
    this.hintText,
    this.forPassword = false,
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CustomTextFieldState();
}

class _CustomTextFieldState extends ConsumerState<CustomTextField> {
  final countryPicker = const flc.FlCountryCodePicker(
    showDialCode: true,
    localize: true,
    showSearchBar: false,
  );
  flc.CountryCode? countryCode;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 52.h,
      width: size.width.w,
      decoration: BoxDecoration(
        color: CustomAppColors.textFieldColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 12).w,
        child: Row(
          children: [
            widget.forMobile
                ? GestureDetector(
                    onTap: () async {
                      final code = await countryPicker.showPicker(
                        context: context,
                      );
                      final dialCode = code!.dialCode;

                      ref.read(mobileCodeProvider.notifier).setCode(dialCode);
                      countryCode = flc.CountryCode(
                        name: code.name,
                        code: code.code,
                        dialCode: code.dialCode,
                      );

                      ref
                          .read(flagProvider.notifier)
                          .updateFlag(countryCode!.flagUri);
                      ref
                          .read(countryNameProvider.notifier)
                          .setCountry(countryCode!.name);
                    },
                    child: Container(
                        height: 52.h,
                        width: 52.w,
                        padding: const EdgeInsets.only(left: 7, right: 7).w,
                        decoration: BoxDecoration(
                          color: CustomAppColors.textFieldColor,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ).w,
                        ),
                        child: Center(
                          child: Consumer(
                            builder: (context, ref, child) {
                              final flagImage = ref.watch(flagProvider);
                              return Image.asset(
                                flagImage,
                                package: countryCode?.flagImagePackage,
                                height: 35.h,
                                width: 30.w,
                              );
                            },
                          ),
                        )),
                  )
                : Container(),
            // const SizedBox(
            //   width: 20,
            // ),
            20.horizontalSpace,
            Expanded(
              child: Consumer(
                builder: (context, ref, child) {
                  final showPassword = ref.watch(showPasswordProvider);
                  final isDarkMode = ref.watch(themeProvider);
                  final mobileController = ref.watch(mobileCodeProvider);
                  return TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: widget.validator,
                    obscureText: widget.forPassword ? showPassword : false,
                    controller: widget.forMobile
                        ? mobileController
                        : widget.textEditingController,
                    keyboardType: widget.forMobile
                        ? TextInputType.phone
                        : TextInputType.text,
                    style: GoogleFonts.nunito(
                      color: isDarkMode
                          ? CustomAppColors.boldTextDarkTheme
                          : CustomAppColors.boldTextLightTheme,
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                    ),
                    cursorColor: CustomAppColors.primaryColor,
                    decoration: InputDecoration(
                      hintText: widget.hintText ?? "",
                      border: InputBorder.none,
                      hintStyle: GoogleFonts.nunito(
                        fontSize: 20.sp,
                        color: isDarkMode
                            ? CustomAppColors.hintTextColorDM
                            : CustomAppColors.hintTextColorLM,
                      ),
                    ),
                  );
                },
              ),
            ),
            widget.forPassword
                ? Container(
                    child: Consumer(
                      builder: (context, ref, child) {
                        final showPassword = ref.watch(showPasswordProvider);
                        final isDarkMode = ref.watch(themeProvider);

                        return GestureDetector(
                          onTap: () => ref
                              .read(showPasswordProvider.notifier)
                              .tuggleOnandOff,
                          child: showPassword
                              ? SvgPicture.asset(
                                  AppImage.showPasswordSvg,
                                  height: 30.h,
                                  color: isDarkMode
                                      ? CustomAppColors.boldTextDarkTheme
                                          .withOpacity(0.9)
                                      : CustomAppColors.boldTextLightTheme
                                          .withOpacity(0.6),
                                )
                              : SvgPicture.asset(
                                  height: 23.h,
                                  AppImage.hidePasswodSvg,
                                  color: isDarkMode
                                      ? CustomAppColors.boldTextDarkTheme
                                          .withOpacity(0.6)
                                      : CustomAppColors.boldTextLightTheme
                                          .withOpacity(0.6),
                                ),
                        );
                      },
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
