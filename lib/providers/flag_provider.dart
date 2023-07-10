import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:gobot_ai/utils/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final flagProvider = StateNotifierProvider<CountryFlagNotifier, String>((ref) {
  return CountryFlagNotifier();
});

class CountryFlagNotifier extends StateNotifier<String> {
  CountryFlagNotifier() : super(AppImage.flags);

  String updateFlag(String flagPath) {
    return state = flagPath;
  }

  String getFlagUrlPackage(String? name, String? code, String? dialCode) {
    final countryCode =
        CountryCode(name: name!, code: code!, dialCode: dialCode!);

    return state = countryCode.flagUri;
  }
}
