import 'dart:convert';
import 'package:ai_journey/config/app_storage.dart';
import 'package:http/http.dart' as http;
import 'package:socket_io_client/socket_io_client.dart' as IO;

final url = 'http://192.168.1.126:5003/';
final urlimage = 'http://192.168.1.126:9000/';

final registration = url + 'api/auth/signup';
final login = url + 'api/auth/login';
final activationToken = url + 'api/auth/activate';
final post = url + 'api/post';
final image = url + 'api/minio/image';

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

  Future<String?> uploadFile(String filePath) async {
    // Tạo một multipart request
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('$image'),
    );

    // Thêm file vào form data của request
    request.files.add(await http.MultipartFile.fromPath(
      'image', // Tên của field form data trong request
      filePath,
    ));
    request.headers['Content-Type'] = 'multipart/form-data';

    request.headers['Authorization'] =
        "Bearer ${AppStorage.instance.getString(key: 'access_token')}";

    // Gửi request và lấy response
    var response = await request.send();

    // Kiểm tra mã trạng thái của response
    if (response.statusCode == 201) {
      print('File uploaded successfully');
      var responseBody = await response.stream.bytesToString();

      Map<String, dynamic> jsonData = jsonDecode(responseBody);

      AppStorage.instance.setString(key: 'url', value: jsonData['data']['url']);

      return jsonData['data']['url'];
    } else {
      print('Failed to upload file. Status code: ${response.statusCode}');
      return null;
    }
  }

  Future<void> postUser(String context, List<dynamic> urlImages) async {
    final Map<String, dynamic> regBody = {
      "content": context,
      "images": urlImages,
      "videos": new List.empty(),
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

  Future<void> sendChat(String context) async {
    // Dart client
    IO.Socket socket = IO.io('$url');
    socket.onConnect((_) {
      print('connect');
      socket.emit('msg', 'test');
    });
    socket.on('event', (data) => print(data));
    socket.onDisconnect((_) => print('disconnect'));
    socket.on('fromServer', (_) => print(_));
  }
}
