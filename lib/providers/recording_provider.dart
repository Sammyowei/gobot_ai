import 'package:hooks_riverpod/hooks_riverpod.dart';

final recordingProvider = StateNotifierProvider<RecordingNotifier, bool>((ref) {
  return RecordingNotifier();
});

class RecordingNotifier extends StateNotifier<bool> {
  RecordingNotifier() : super(false);

  bool get isRecording => state = true;

  bool get isNotRecording => !isRecording;
}
