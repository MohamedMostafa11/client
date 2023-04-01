import 'dart:convert';
import 'package:http/http.dart' as http;

class APIService {
  static const String baseURL =
      'http://127.0.0.1:8000/api/'; // Replace with your API URL

  static Future<dynamic> registerUser(Map<String, dynamic> data) async {
    var response = await http.post(Uri.parse(baseURL + 'register/'),
        headers: {'Content-Type': 'application/json'}, body: jsonEncode(data));
    return jsonDecode(response.body);
  }

  static Future<dynamic> loginUser(Map<String, dynamic> data) async {
    var response = await http.post(Uri.parse(baseURL + 'login/'),
        headers: {'Content-Type': 'application/json'}, body: jsonEncode(data));
    return jsonDecode(response.body);
  }
}
