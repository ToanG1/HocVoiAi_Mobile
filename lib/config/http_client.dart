import 'dart:convert';
import 'package:ai_journey/config/app_storage.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../enum.dart';

final url = 'http://192.168.1.126:5003/';
final urlimage = 'http://192.168.1.126:9000/';

final registration = url + 'api/auth/signup';
final login = url + 'api/auth/login';
final activationToken = url + 'api/auth/activate';
final post = url + 'api/post';

class HttpService {
  final String baseUrl;

  HttpService(this.baseUrl);

  Future<void> loginUser(String username, String password) async {
    final String loginEndpoint = 'api/auth/login';
    final Map<String, String> regBody = {
      "email": username,
      "password": password,
    };

    try {
      final response = await http.post(
        Uri.parse('$baseUrl$loginEndpoint'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(regBody),
      );

      if (response.statusCode == 201) {
        // Đăng nhập thành công
        print("Đăng nhập thành công: ${response.body}");
        Map<String, dynamic> jsonData = jsonDecode(response.body);

        AppStorage.instance.setString(
            key: 'access_token', value: jsonData['data']['access_token']);
        //return accessToken;
      } else {
        print("Đăng nhập không thành công: ${response.body}");
        throw Exception("Đăng nhập không thành công");
      }
    } catch (error) {
      print("Đăng nhập không thành công: $error");
      throw Exception("Đăng nhập không thành công");
    }
  }

  Future<void> postUser(String context) async {
    final Map<String, String> regBody = {
      "content": context,
    };
    try {
      final response = await http.post(
        Uri.parse('$post'),
        headers: {
          "Content-Type": "application/json",
          "Authorization":
              "Bearer ${AppStorage.instance.getString(key: 'access_token')}",
        },
        body: jsonEncode(regBody),
      );
      if (response.statusCode == 201) {
        // Đăng nhập thành công
        print("Đăng bài thành công: ${response.body}");
      } else {
        print("Đăng bài không thành công: ${response.body}");
      }
      // Xử lý phản hồi từ server
    } catch (error) {
      print("Đã xảy ra lỗi khi đăng bài: $error");
    }
  }
}
