import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voice_message_package/voice_message_package.dart';

import '../providers/providers.dart';
import '../style/styles.dart';
import '../widgets/widgets.dart';
import 'chat_message_model.dart';

class ChatBubble extends ConsumerWidget {
  final String? audioFilePath;
  final MessageType messageType;
  final GobotChatMessage chatMessage;
  const ChatBubble(
      {this.audioFilePath,
      required this.chatMessage,
      this.messageType = MessageType.sender,
      super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeProvider);
    return Align(
      alignment: (messageType == MessageType.reciever)
          ? Alignment.bottomLeft
          : Alignment.bottomRight,
      child: (chatMessage.chatType == GChatType.audioMessage)
          ? VoiceMessage(
              me: true,
              meBgColor: CustomAppColors.primaryColor,
              mePlayIconColor: CustomAppColors.primaryColor,
              formatDuration: (duration) {
                final seconds = duration.inSeconds;
                final minute = duration.inMinutes;

                var durationFormat = '$minute:$seconds';
                return durationFormat;
              },
              audioSrc: audioFilePath,
            )
          : Container(
              padding:
                  const EdgeInsets.only(left: 12, right: 18, top: 10, bottom: 5)
                      .w,
              decoration: BoxDecoration(
                borderRadius: (messageType == MessageType.sender)
                    ? const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                      ).r
                    : const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ).r,
                color: (messageType == MessageType.sender)
                    ? const Color(0xFFFF3E3F)
                    : const Color(0x33AFAFAF),
              ),
              width: (chatMessage.message!.split(" ").length >= 4)
                  ? MediaQuery.of(context).size.width / 1.6
                  : (chatMessage.message!.split(" ").length <= 2)
                      ? 115
                      : (chatMessage.message!.split(" ").length < 4)
                          ? 150
                          : MediaQuery.of(context).size.width / 1.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: chatMessage.message!,
                    textAlign: TextAlign.start,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w500,
                    textColor: (messageType == MessageType.sender)
                        ? Colors.white
                        : isDarkMode
                            ? CustomAppColors.boldTextDarkTheme
                            : CustomAppColors.boldTextLightTheme,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomText(
                          text:
                              "${chatMessage.createdAt.hour}:${chatMessage.createdAt.minute}",
                          fontSize: 10.sp,
                          textColor: (messageType == MessageType.sender)
                              ? Colors.white.withOpacity(0.7)
                              : isDarkMode
                                  ? CustomAppColors.boldTextDarkTheme
                                      .withOpacity(0.7)
                                  : CustomAppColors.boldTextLightTheme
                                      .withOpacity(0.7),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}

enum MessageType { sender, reciever }
