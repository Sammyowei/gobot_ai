import 'dart:convert';

import 'package:gobot_ai/env/env.dart';
import 'package:gobot_ai/models/bot_request_model.dart';
import 'package:http/http.dart' as http;

class BotCommunicatorRepo {
  Future botRequest({
    required BotRequestModel requestModel,
  }) async {
    final model = EnvVariable.aiBotModel;
    final url = Uri.parse(EnvVariable.aiBotEndpoint);

    var body = requestModel.body;
    final header = requestModel.header;

    body.addAll({
      "model": model,
    });

    final response = await http.post(url, body: body, headers: header);

    final responseBody = jsonDecode(response.body);
    return responseBody;
  }
}
