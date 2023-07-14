import 'package:hooks_riverpod/hooks_riverpod.dart';

final showPasswordProvider =
    StateNotifierProvider<ShowPasswordNotifier, bool>((ref) {
  return ShowPasswordNotifier();
});

class ShowPasswordNotifier extends StateNotifier<bool> {
  ShowPasswordNotifier() : super(false);

  bool get tuggleOnandOff => state = !state;
}
