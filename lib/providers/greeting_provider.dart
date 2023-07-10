import 'package:hooks_riverpod/hooks_riverpod.dart';

final greetingProvider = StateNotifierProvider<GreetingNotifier, String>((ref) {
  return GreetingNotifier();
});

class GreetingNotifier extends StateNotifier<String> {
  GreetingNotifier() : super("");

  String get greeting {
    final time = DateTime.now();
    if (time.hour < 12) {
      return state = state = "Good morning";
    } else if (time.hour < 17) {
      return state = state = "Good afternoon";
    } else {
      return state = state = "Good evening";
    }
  }
}
