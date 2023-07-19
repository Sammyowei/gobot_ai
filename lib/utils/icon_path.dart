const String iconPath = "assets/icons/";

extension IconExtension on String {
  String get svg => "$iconPath$this.svg";
  String get png => "$iconPath$this.png";
}

class AppIcons {
  static String qAndA = "q_and_a".svg;
  static String translify = "translify".svg;
  static String simplfy = "simplify".svg;
  static String linguaBot = "lingua_bot".svg;
  static String nameGen = "name_gen".svg;
  static String recipeGen = "recipe_gen".svg;
  static String sassyBot = "sassy_bot".svg;
  static String directions = "direction".svg;
  static String bfffBot = "bfff_bot".svg;
  static String tutorBot = "tutor_bot".svg;
  static String premium = "premium".svg;
  static String logOut = "log_out".svg;
  static String user = "urser_profile".svg;
  static String changePassword = "change_password".svg;
  static String forTheme = "theme".svg;
  static String subscription = "subscription".svg;
  static String termsAndConditions = "terms_and_conditions".svg;
  static String recorder = "recorder_icon".svg;
  static String send = "send".svg;
  static String pause = "pause".svg;
  static String stop = "stop-button".png;
}
