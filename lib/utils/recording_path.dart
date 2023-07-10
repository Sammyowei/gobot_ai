import 'dart:io';

class RecordingPath {
  static String get recordingPath => (Platform.isAndroid)
      ? "/storage/emulated/0/Android/data/com.bumblestudio.gobot.ai/files/gobot/data/.recording"
      : "Get the ios file Directory";
}
