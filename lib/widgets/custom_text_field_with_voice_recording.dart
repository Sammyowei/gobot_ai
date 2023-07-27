import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gobot_ai/models/chat_message_model.dart';
import 'package:gobot_ai/models/models.dart';
import 'package:gobot_ai/repo/repository.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:record/record.dart';

import '../providers/providers.dart';
import '../style/styles.dart';
import '../utils/utils.dart';

class CustomChatTextField extends ConsumerStatefulWidget {
  final TextEditingController? controller;
  final AiBotModels model;
  const CustomChatTextField({required this.model, this.controller, super.key});

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
    final isRecording = ref.watch(recordingProvider);

    return Container(
      padding: const EdgeInsets.only(top: 8, left: 20, right: 20, bottom: 8).w,
      color: isDarkMode ? CustomAppColors.darkMode : CustomAppColors.lightMode,
      width: MediaQuery.of(context).size.width,
      height: 80.h,
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer(
              builder: (context, ref, child) {
                return isTyping
                    ? Container()
                    : GestureDetector(
                        onTap: () =>
                            isRecording ? stopRecording() : startRecording(),
                        child: Container(
                          height: 50.h,
                          width: 50.w,
                          padding: EdgeInsets.zero,
                          decoration: ShapeDecoration(
                            shape: const CircleBorder(),
                            color: CustomAppColors.primaryColor,
                          ),
                          child: Center(
                            child: isRecording
                                ? Image.asset(
                                    AppIcons.stop,
                                    height: 25.h,
                                    width: 25.h,
                                    color: CustomAppColors.boldTextDarkTheme,
                                  )
                                : SvgPicture.asset(
                                    AppIcons.recorder,
                                    height: 25.h,
                                    width: 25.w,
                                  ),
                          ),
                        ),
                      );
              },
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
                      addTextMessage();
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
    ref.read(recordingProvider.notifier).isRecording;
    if (await _record.hasPermission()) {
      final fileName = DateTime.now().millisecondsSinceEpoch;

      await _record.start(
        path: "$filePath/$fileName.wav",
        encoder: AudioEncoder.aacLc,
      );
    }
  }

// TODO: function to stop recording

  void stopRecording() async {
    ref.read(recordingProvider.notifier).isNotRecording;
    final audioPath = await _record.stop();
    addRecordingMessage(audioPath);
  }

  // TODO: funtion to resume Recording

  void addRecordingMessage(String? path) async {
    ref.read(chatHistoryProvider.notifier).addChat(
          ChatBubble(
            audioFilePath: path,
            messageType: MessageType.sender,
            chatMessage: GobotChatMessage(
              chatType: GChatType.audioMessage,
              chatUser: GChatUser(
                author: ChatAuthor.user,
                id: "user",
              ),
              createdAt: DateTime.now(),
            ),
          ),
        );

    processRecorededAudio(path ?? "");
  }

  void addTextMessage() async {
    final text = widget.controller?.text.trim();
    widget.controller!.clear();
    ref.read(chatHistoryProvider.notifier).addChat(
          ChatBubble(
            messageType: MessageType.sender,
            chatMessage: GobotChatMessage(
              chatType: GChatType.textMesage,
              chatUser: GChatUser(
                author: ChatAuthor.user,
                id: "user",
              ),
              createdAt: DateTime.now(),
              message: text,
            ),
          ),
        );
    ref.read(botPromptMessageProvider.notifier).addMesages({
      "role": "user",
      "content": text!,
    });
    final response = await BotCommunicatorRepo().botRequest(ref);
    final responseText = response["choices"][0]["message"]["content"] as String;
    ref.read(chatHistoryProvider.notifier).addChat(
          ChatBubble(
            messageType: MessageType.reciever,
            chatMessage: GobotChatMessage(
              chatType: GChatType.textMesage,
              chatUser: GChatUser(author: ChatAuthor.bot, id: "assistant"),
              createdAt: DateTime.now(),
              message: responseText,
            ),
          ),
        );
    ref.read(botPromptMessageProvider.notifier).addMesages(
      {
        "role": "assistant",
        "content": responseText,
      },
    );
  }

  void processRecorededAudio(String audioPath) async {
    final transcriber = AudioTransciptionRepo();
    final message = ref.watch(botPromptMessageProvider);
    final transcribedText = await transcriber.transcribeAudio(audioPath);
    log(transcribedText);

    ref.read(botPromptMessageProvider.notifier).addMesages({
      "role": "user",
      "content": transcribedText,
    });
    final response = await BotCommunicatorRepo().botRequest(
      ref,
    );
    final responseText = response["choices"][0]["message"]["content"] as String;
    ref.read(chatHistoryProvider.notifier).addChat(
          ChatBubble(
            messageType: MessageType.reciever,
            chatMessage: GobotChatMessage(
              chatType: GChatType.textMesage,
              chatUser: GChatUser(author: ChatAuthor.bot, id: "assistant"),
              createdAt: DateTime.now(),
              message: responseText,
            ),
          ),
        );
    ref.read(botPromptMessageProvider.notifier).addMesages(
      {
        "role": "assistant",
        "content": responseText,
      },
    );

    log(message.toString());
  }
}
