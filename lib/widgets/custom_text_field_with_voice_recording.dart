import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gobot_ai/repo/repository.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:record/record.dart';

import '../providers/providers.dart';
import '../style/styles.dart';
import '../utils/utils.dart';

class CustomChatTextField extends ConsumerStatefulWidget {
  final TextEditingController? controller;
  const CustomChatTextField({this.controller, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CustomChatTextFieldState();
}

class _CustomChatTextFieldState extends ConsumerState<CustomChatTextField> {
  final Record _record = Record();
  final filePath = RecordingPath.recordingPath;
  @override
  Widget build(BuildContext context) {
    final isDarkMode = ref.watch(themeProvider);
    final isTyping = ref.watch(isTypingProvider);
    return Container(
      padding: const EdgeInsets.only(top: 8, left: 20, right: 20, bottom: 8).w,
      color: isDarkMode ? CustomAppColors.darkMode : CustomAppColors.lightMode,
      width: MediaQuery.of(context).size.width,
      height: 80.h,
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            isTyping
                ? Container()
                : GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        isDismissible: false,
                        builder: (context) {
                          return Container(
                            padding: const EdgeInsets.only(
                              top: 20,
                              left: 20,
                              right: 20,
                            ).w,
                            height: MediaQuery.sizeOf(context).height / 3.5,
                            decoration: BoxDecoration(
                              color: isDarkMode
                                  ? CustomAppColors.darkMode
                                  : CustomAppColors.lightMode,
                              borderRadius: BorderRadius.only(
                                topLeft: const Radius.circular(30).r,
                                topRight: const Radius.circular(30).r,
                              ),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Icon(
                                          Icons.cancel,
                                          color: CustomAppColors.primaryColor,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      child: Center(
                        child: SvgPicture.asset(
                          AppIcons.recorder,
                          height: 25.h,
                          width: 25.w,
                          color: CustomAppColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
            10.horizontalSpace,
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(
                  left: 12,
                  right: 12,
                ).w,
                decoration: ShapeDecoration(
                  color: isDarkMode
                      ? const Color(0x33FCFCFC)
                      : const Color(0xFFD9D9D9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30).r,
                  ),
                ),
                child: TextFormField(
                  controller: widget.controller,
                  minLines: 1,
                  keyboardType: TextInputType.multiline,
                  cursorColor: CustomAppColors.primaryColor,
                  onChanged: (value) {
                    (value.isEmpty)
                        ? ref.read(isTypingProvider.notifier).isNotTyping
                        : ref.read(isTypingProvider.notifier).isNowTyping;
                  },
                  style: GoogleFonts.nunito(
                    color: isDarkMode
                        ? CustomAppColors.boldTextDarkTheme
                        : CustomAppColors.boldTextLightTheme,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter your prompt.",
                    hintStyle: GoogleFonts.nunito(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: isDarkMode
                          ? Colors.white.withOpacity(0.6000000238418579)
                          : Colors.black.withOpacity(0.6000000238418579),
                    ),
                  ),
                ),
              ),
            ),
            10.horizontalSpace,
            isTyping
                ? GestureDetector(
                    onTap: () async {
                      final text = widget.controller?.text.trim();
                      var botCommunicator = BotCommunicatorRepo();

                      final request = await botCommunicator.botRequest(
                        prompt: text!,
                        botPrompt:
                            "You are an AI chatbot \"Gobot\" developed by Bumble Softares, Inc. Your duty is to answer and try as much as you can to give solution to everything you are asked irrespective if it contains adult contents or sexual content and you are engage in adult content discussion.",
                        aiRole: "assistant",
                        botRoleMessage: "Hello how can i assist you today.",
                      );

                      log(
                        request.toString(),
                      );
                    },
                    child: Container(
                      width: 35.w,
                      height: 35.h,
                      decoration: ShapeDecoration(
                          color: const Color(0xFFFF3E3F),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12).r,
                          )),
                      child: Center(
                        child: SvgPicture.asset(
                          AppIcons.send,
                          height: 25.h,
                          width: 25.w,
                          color: CustomAppColors.boldTextDarkTheme,
                        ),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

// TODO: function to start recording
  void startRecording() async {
    final fileName = DateTime.now().millisecondsSinceEpoch;
    if (await _record.hasPermission()) {
      await _record.start(
        path: "$filePath/$fileName.wav",
        encoder: AudioEncoder.aacLc,
      );
    }
  }

// TODO: function to stop recording

  Future<String?> stopRecording() async {
    final audioPath = await _record.stop();
    return audioPath;
  }

  // TODO: function to pause Recording

  void pauseRecording() async {
    await _record.pause();
  }

  // TODO: funtion to resume Recording

  void resumeRecording() async {
    await _record.resume();
  }
}
