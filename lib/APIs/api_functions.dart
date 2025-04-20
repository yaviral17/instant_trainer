import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:instant_trainer/APIs/api_urls.dart';

Future<Map<String, dynamic>> tGetDietPlan(String prompt) async {
  var headers = {
    'Content-Type': 'application/json',

    "Authorization": "Bearer ${dotenv.env['API_KEY']}",
  };
  var request = http.Request('POST', Uri.parse('$tHost$tChat'));
  request.body = jsonEncode({
    "messages": [
      {"role": "system", "content": prompt},
    ],
    "model": "meta-llama/llama-4-scout-17b-16e-instruct",
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
