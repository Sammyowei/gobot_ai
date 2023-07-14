import 'package:hooks_riverpod/hooks_riverpod.dart';

final themeProvider = StateNotifierProvider<ThemeNotifier, bool>(
  (ref) => ThemeNotifier(),
);

class ThemeNotifier extends StateNotifier<bool> {
  ThemeNotifier() : super(true);

  bool get tuggleThemes => state = !state;
  bool themeValue(bool value) {
    return state = value;
  }
}
