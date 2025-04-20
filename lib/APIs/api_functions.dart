import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> tGetDietPlan(String prompt) async {
  var headers = {'Content-Type': 'application/json'};
  var request = http.Request(
    'POST',
    Uri.parse('http://192.168.29.118:11434/api/chat'),
  );
  request.body = jsonEncode({
    "messages": [
      {"role": "system", "content": prompt},
    ],
    "model": "gemma3:1b",
    "temperature": 1,
    "max_completion_tokens": 1024,
    "top_p": 1,
    "stream": false,
    "stop": null,
  });
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    Map<String, dynamic> data = jsonDecode(
      await response.stream.bytesToString(),
    );
    data['isSuccess'] = true;
    return data;
  } else {
    Map<String, dynamic> errorResponse = {
      'isSuccess': false,
      'error': 'Unexpected response: ${response.statusCode}',
    };
    return errorResponse;
  }
}
