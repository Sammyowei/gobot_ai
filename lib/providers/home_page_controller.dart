import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';


final pageSellectorProvider = StateNotifierProvider<HomePageControllerNotifier, PageController>((ref) {
  return  HomePageControllerNotifier();
});
class HomePageControllerNotifier extends StateNotifier<PageController> {
  HomePageControllerNotifier()
      : super(PageController(
          initialPage: 0,
          keepPage: true,
        ));

  void moveToNextPage(int index) {
    state.animateToPage(index,
        duration: const Duration(milliseconds: 1500),
        curve: Curves.fastLinearToSlowEaseIn);
  }
}
