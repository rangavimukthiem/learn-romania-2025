import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  final String apiKey = "YOUR_API_KEY"; // Replace with your API key
  final String baseUrl = "";

  Future<Map<String, dynamic>> fetchWeather(String city) async {
    try {
      final response = await http.get(
        Uri.parse("$baseUrl?q=$city&appid=$apiKey&units=metric")
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception("Failed to load weather data");
      }
    } catch (e) {
      return {};
    }
  }
}
