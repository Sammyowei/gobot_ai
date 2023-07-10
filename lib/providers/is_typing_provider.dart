import 'package:hooks_riverpod/hooks_riverpod.dart';

final isTypingProvider = StateNotifierProvider<TypingNotifier, bool>((ref) {
  return TypingNotifier();
});

class TypingNotifier extends StateNotifier<bool> {
  TypingNotifier() : super(false);

  bool get isNowTyping => state = state = true;
  bool get isNotTyping => state = state = false;
}
