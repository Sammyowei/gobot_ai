import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gobot_ai/providers/theme_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void setStatusBarColor(WidgetRef ref) {
  final darkTheme = ref.watch(themeProvider);
  if (darkTheme == true) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));
  } else {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
  }
}
