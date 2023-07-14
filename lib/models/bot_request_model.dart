class BotRequestModel {
  final String prompt;
  final Map<String, String> header;
  final Map<String, dynamic> body;

  BotRequestModel(
      {required this.prompt, required this.body, required this.header});
}
