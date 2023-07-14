import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gobot_ai/models/chat_message_model.dart';
import 'package:gobot_ai/models/models.dart';
import 'package:gobot_ai/repo/audio_transcription_repo.dart';
import 'package:gobot_ai/utils/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:record/record.dart';

import '../providers/providers.dart';

class RecorderWidgets extends ConsumerStatefulWidget {
  const RecorderWidgets({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RecorderWidgetsState();
}

class _RecorderWidgetsState extends ConsumerState<RecorderWidgets> {
  Record recorder = Record();
  final _recordingPath = RecordingPath.recordingPath;


  @override
  Widget build(BuildContext context) {
    // TODO: add the recording notifier.
    // final isRecording = ref.watch(recordingProvider);
    return Container(
      height: MediaQuery.of(context).size.height / 3.5,
      padding: const EdgeInsets.only(
        top: 10,
        left: 20,
        right: 20,
        bottom: 10,
      ).w,
      decoration: ShapeDecoration(
        color: const Color(0xFF1D1D1D),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(40).r,
            topRight: const Radius.circular(40).r,
          ),
        ),
      ),
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  // startRecord(),
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () async => await startRecording(ref),
                  child: const Icon(Icons.record_voice_over),
                ),
                GestureDetector(
                  onTap: () async => await stopRecording(ref),
                  child: const Icon(Icons.stop),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> startRecording(WidgetRef ref) async {
    final recordName = DateTime.now().millisecondsSinceEpoch;
    try {
      if (await recorder.hasPermission()) {
        await recorder
            .start(
              path: "$_recordingPath/$recordName.wav",
              encoder: AudioEncoder.aacLc,
            )
            .then(
              (value) {},
            );
      }
    } catch (error) {
      log(
        error.toString(),
      );
    }
  }

  Future<void> stopRecording(WidgetRef ref) async {
    try {
      final transcriber = AudioTransciptionRepo();
      await recorder.stop().then((file) async {
        log(file ?? "error no file found");
        Navigator.of(context).pop();
        ref.read(chatHistoryProvider.notifier).addChat(
              ChatBubble(
                chatMessage: GobotChatMessage(
                  chatType: GChatType.audioMessage,
                  chatUser: GChatUser(author: ChatAuthor.user, id: "User"),
                  createdAt: DateTime.now(),
                ),
                messageType: MessageType.sender,
                audioFilePath: file,
              ),
            );

        await transcriber.transcribeAudio(file);
      });
    } catch (error) {
      log(
        error.toString(),
      );
    }
  }
}
