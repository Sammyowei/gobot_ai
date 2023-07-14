import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';

final pageControllerProvider =
    StateNotifierProvider<PageNotifier, PageController>((ref) {
  return PageNotifier();
});

class PageNotifier extends StateNotifier<PageController> {
  PageNotifier()
      : super(PageController(
          initialPage: 0,
          keepPage: true,
        ));

  final List<String> buttonText = ["Continue", "Continue", "Finish"];

  double? get page => state.page;

  void nextPage() {
    state.nextPage(
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }

  String getButtonText(int currentIndex) {
    return buttonText[currentIndex];
  }

  void moveToPage(int pageIndex) {
    state.animateToPage(
      pageIndex,
      duration: const Duration(
        milliseconds: 500,
      ),
      curve: Curves.ease,
    );
  }
}

final buttonTextProvider = StateNotifierProvider<ButtonNotifier, String>((ref) {
  return ButtonNotifier();
});

class ButtonNotifier extends StateNotifier<String> {
  ButtonNotifier() : super("Next");

String get firstText => state = state = "Next";
  String get lastText => state = state = "Continue";
}
