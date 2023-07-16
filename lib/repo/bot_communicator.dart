import 'dart:convert';

import 'package:gobot_ai/env/env.dart';
import 'package:http/http.dart' as http;

class BotCommunicatorRepo {
  Future botRequest({
    required String prompt,
    required String botPrompt,
    required String aiRole,
    required String botRoleMessage,
  }) async {
    final model = EnvVariable.aiBotModel;
    final apiKey = EnvVariable.API_KEY;
    final url = Uri.parse(EnvVariable.aiBotEndpoint);

    var messages = <Map<String, String>>[
      {
        "role": "system",
        "content": botPrompt,
      },
      {
        "role": aiRole,
        "content": botRoleMessage
      },
      {
        "role": "user",
        "content": prompt,
      }
    ];
    var body = {
      "model": model,
      "messages": messages,
    };
    final header = <String, String>{
      "Content-Type": 'application/json',
      'Authorization': 'Bearer $apiKey',
    };

    final response =
        await http.post(url, body: jsonEncode(body), headers: header);

    final responseBody = jsonDecode(response.body);
    return responseBody;
  }
}
