import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final mobileCodeProvider =
    StateNotifierProvider<MobileNotifier, TextEditingController>((ref) {
  return MobileNotifier();
});

class MobileNotifier extends StateNotifier<TextEditingController> {
  MobileNotifier() : super(TextEditingController());

  void setCode(String code) {
    state.text = code;
  }
}

final countryNameProvider =
    StateNotifierProvider<CountryNotifier, TextEditingController>((ref) {
  return CountryNotifier();
});

class CountryNotifier extends StateNotifier<TextEditingController> {
  CountryNotifier() : super(TextEditingController());

  void setCountry(String country) {
    state.text = country;
  }
}
