const String imagePath = "assets/images/";

extension ImageExtension on String {
  String get svg => "$imagePath$this.svg";
  String get png => "$imagePath$this.png";
}

class AppImage {
  static String logo = "splash_icon".svg;
  static String flags = "flag".png;
  static String onboardingOne = "onboarding_one".png;
  static String onboardingTwo = "onboarding_two".png;
  static String onboardingThree = "onboarding_three".png;
  static String showPasswordSvg = "show_password".svg;
  static String hidePasswodSvg = "hide_password".svg;
  static String googleLogoSvg = "google_logo".svg;
  static String appleLogoLmSvg = "apple_lm".svg;
  static String appleLogoDmSvg = "apple_dm".svg;
  static String navBackSvg = "nav_back".svg;
  static String voiceSvg = "voice".svg;
  static String homeSvg = "home".svg;
  static String exploreSvg = "explore".svg;
  static String settingsSvg = "settings".svg;
  static String navFowardSvg = "forward".svg;
  static String chatbotImage = "chatbot_image".png;
}
