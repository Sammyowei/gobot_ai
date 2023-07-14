import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:gobot_ai/env/env.dart';

class AudioTransciptionRepo {
  Future<void> transcribeAudio(String? filePath) async {
    final apiKey = EnvVariable.API_KEY;
    final url = EnvVariable.audioTranscriptionUrl;
    final model = EnvVariable.transcriptionAIModel;
    var header = {
      'Authorization': 'Bearer $apiKey',
      'Content-Type': 'multipart/form-data'
    };
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(url),
    );
    request.fields.addAll({
      'model': model,
    });
    request.files.add(
      await http.MultipartFile.fromPath(
          'file', filePath ?? '/home/samuelson/Music/Khalid_Silence.mp3'),
    );
    request.headers.addAll(header);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(
        await response.stream.bytesToString(),
      );
      final text = jsonResponse["text"];
      log(text);
    } else {
      log(response.reasonPhrase!);
    }
  }
}
