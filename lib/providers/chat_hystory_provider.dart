import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:gobot_ai/models/models.dart';

final chatHistoryProvider =
    StateNotifierProvider<ChatNotifier, List<ChatBubble>>((ref) {
  return ChatNotifier();
});

class ChatNotifier extends StateNotifier<List<ChatBubble>> {
  ChatNotifier() : super([]);

  void addChat(ChatBubble chat) {
    state = [...state, chat];
  }
}
