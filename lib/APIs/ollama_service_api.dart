import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:instant_trainer/APIs/api_urls.dart';

class OllamaService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: tHost,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 20),
      headers: {'Content-Type': 'application/json'},
    ),
  );

  Future<Map<String, dynamic>> sendChatPrompt(
    String prompt, {
    String model = 'gemma3:1b',
  }) async {
    try {
      final response = await _dio.post(
        '/api/chat',
        data: {
          "model": model,
          "messages": [
            {"role": "user", "content": prompt},
          ],
          "stream": false,
          // "token": 2000,
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> data = response.data;
        data['isSuccess'] = true;
        return data;
      } else {
        Get.log('Unexpected response: ${response.statusCode}');
        return {
          'isSuccess': false,
          'error': 'Unexpected response: ${response.statusCode}',
        };
      }
    } on DioException catch (e) {
      Get.log('Ollama Dio error: ${e.message}');
      return {'isSuccess': false, 'error': e.message};
    } catch (e) {
      Get.log('Unexpected error: $e');
      return {'isSuccess': false, 'error': 'Unexpected error: $e'};
    }
  }
}
