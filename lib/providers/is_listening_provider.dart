import 'package:hooks_riverpod/hooks_riverpod.dart';

final isListeningProvider =
    StateNotifierProvider<ListeningNotifier, bool>((ref) {
  return ListeningNotifier();
});

class ListeningNotifier extends StateNotifier<bool> {
  ListeningNotifier() : super(false);

  bool get isListening => state = state = true;
  bool get isNoLogerListening => state = state = false;
}
