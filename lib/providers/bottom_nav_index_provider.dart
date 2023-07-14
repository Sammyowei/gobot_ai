import 'package:hooks_riverpod/hooks_riverpod.dart';

final bottomNavIndexProvider =
    StateNotifierProvider<BottomNavNotifier, int>((ref) {
  return BottomNavNotifier();
});

class BottomNavNotifier extends StateNotifier<int> {
  BottomNavNotifier() : super(0);

  void getIndex(int index) {
    state = state = index;
  }
}
