import 'package:hooks_riverpod/hooks_riverpod.dart';

final recordingProvider = StateNotifierProvider<RecordingNotifier, bool>((ref) {
  return RecordingNotifier();
});

final completedRecordingProvider =
    StateNotifierProvider<RecordingCompletedNotifier, bool>(
  (ref) => RecordingCompletedNotifier(),
);

final recordingPathProvider =
    StateNotifierProvider<RecordingPathNotifier, String>((ref) {
  return RecordingPathNotifier();
});

class RecordingNotifier extends StateNotifier<bool> {
  RecordingNotifier() : super(false);

  bool get isRecording => state = true;

  bool get isNotRecording => state = false;
}

class RecordingCompletedNotifier extends StateNotifier<bool> {
  RecordingCompletedNotifier() : super(false);

  bool get haveNotStartedRecording => state = state = false;
  bool get recordingCompleted => state = true;
}

class RecordingPathNotifier extends StateNotifier<String> {
  RecordingPathNotifier() : super("");

  void addPath(String path) {
    state = state = path;
  }
}

class RecordBottonNotifier extends StateNotifier<bool> {
  RecordBottonNotifier() : super(false);

  bool get isClicked => state = state = true;
  bool get isNotClicked => state = state = false;
}
