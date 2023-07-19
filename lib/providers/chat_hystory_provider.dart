import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:gobot_ai/models/models.dart';

final chatHistoryProvider =
    StateNotifierProvider<ChatNotifier, List<ChatBubble>>((ref) {
  return ChatNotifier();
});

final botPromptMessageProvider =
    StateNotifierProvider<BotPromptNotifier, List<Map<String, String>>>(
        (ref) => BotPromptNotifier());

class ChatNotifier extends StateNotifier<List<ChatBubble>> {
  ChatNotifier() : super([]);

  void addChat(ChatBubble chat) {
    state = [...state, chat];
  }
}

class BotPromptNotifier extends StateNotifier<List<Map<String, String>>> {
  BotPromptNotifier() : super([]);

  void addMesages(Map<String, String> messages) {
    state = [...state, messages];
  }

  void addMainPrompt(List<Map<String, String>> mainPrompt) {
    state = [...state, ...mainPrompt];
  }
}
