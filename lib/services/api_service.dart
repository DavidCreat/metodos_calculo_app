import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/api_response.dart';

class ApiService {
  static const String baseUrl = 'http://localhost:5000';

  static Future<ApiResponse> resolverEcuacion(Map<String, dynamic> body) async {
    final url = Uri.parse('$baseUrl/resolver');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      return ApiResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error: ${response.statusCode} ${response.body}');
    }
  }
}
