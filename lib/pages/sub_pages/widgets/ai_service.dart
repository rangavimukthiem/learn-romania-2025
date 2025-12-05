import 'dart:convert';
import 'package:http/http.dart' as http;

class AIService {
  static const String apiKey =
      'sk-6e842dc7c6b04b68b11c2e7d1d6683e8'; // Replace with your API key
  static const String apiUrl = 'https://api.deepseek.com';

  static Future<String> generateContent(String city) async {
    try {
      var response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
        body: jsonEncode({
          "model": "gpt-4",
          "messages": [
            {"role": "system", "content": "You are a travel writer."},
            {
              "role": "user",
              "content": "Write 10 paragraphs about $city in Romania."
            }
          ],
          "max_tokens": 1000
        }),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return data['choices'][0]['message']['content'];
      } else {
        return "Error: ${response.reasonPhrase}";
      }
    } catch (e) {
      return "Error: $e";
    }
  }
}
