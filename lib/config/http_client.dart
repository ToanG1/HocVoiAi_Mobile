import 'dart:convert';
import 'dart:io';
import 'package:ai_journey/config/app_storage.dart';
import 'package:http/http.dart' as http;

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

  // Future<void> upload() async {
  //   // Lấy danh sách các tệp đã chọn từ phần tử nhập.
  //   List<File> files = []; // Danh sách chứa các tệp đã chọn.
  //   // Điều này phụ thuộc vào cách bạn lấy được danh sách các tệp đã chọn từ giao diện người dùng trong Flutter.

  //   for (var i = 0; i < files.length; i++) {
  //     var file = files[i];
  //     // Lấy URL từ máy chủ của chúng tôi.
  //     // Tải tệp lên máy chủ.
  //     await uploadFile(file);
  //   }
  // }

  // Future<void> uploadFile(File file) async {

  //   final Map<String, String> regBody = {
  //     "image": "${file.path}",
  //   };
  //   try {
  //     final response = await http.post(
  //       Uri.parse('$image'),
  //       headers: {
  //         "Content-Type": "multipart/form-data",
  //         "Authorization":
  //             "Bearer ${AppStorage.instance.getString(key: 'access_token')}",
  //       },
  //       body: jsonEncode(regBody),
  //     );
  //     if (response.statusCode == 201) {
  //       // Đăng nhập thành công
  //       Map<String, dynamic> jsonData = jsonDecode(response.body);

  //       print("Đăng bài thành công: ${response.body}");

  //       AppStorage.instance
  //           .setString(key: 'url', value: jsonData['data']['url']);
  //     } else {
  //       print("Đăng bài không thành công: ${response.body}");

  //       AppStorage.instance.setString(key: 'url', value: 'null');

  //       // return jsonData['data']['url'];
  //     }
  //     // Xử lý phản hồi từ server
  //   } catch (error) {
  //     print("Đã xảy ra lỗi khi đăng bài: $error");
  //     //throw error;
  //   }

  //   // try {
  //   //   var request = http.Request('POST', Uri.parse(urlimage));

  //   //   request.headers['Content-Type'] = 'multipart/form-data';
  //   //   request.headers['Authorization'] =
  //   //       "Bearer  ${AppStorage.instance.getString(key: 'access_token')}";

  //   //   var response =
  //   //       await request.send().then((http.StreamedResponse streamedResponse) {
  //   //     if (streamedResponse.statusCode == 200) {
  //   //       // Nếu muốn xử lý phản hồi, bạn có thể làm ở đây.
  //   //       print('Uploaded ${file.path}');
  //   //     } else {
  //   //       throw Exception(
  //   //           'Failed to upload file: ${streamedResponse.reasonPhrase}');
  //   //     }
  //   //   });
  //   // } catch (e) {
  //   //   print('Error uploading file: $e');
  //   //   rethrow; // Re-throw the exception for handling by the caller.
  //   // }
  // }
  Future<void> uploadFile(String filePath) async {
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
      print(jsonData);
      print('-------------------------------------');

      print(AppStorage.instance.getString(key: 'url'));
    } else {
      print('Failed to upload file. Status code: ${response.statusCode}');
    }
  }

  Future<void> postUser(String context) async {
    final Map<String, String> regBody = {
      "content": context,
      "images": AppStorage.instance.getString(key: 'url') ?? "",
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
        print(AppStorage.instance.getString(key: 'url'));
      }
      // Xử lý phản hồi từ server
    } catch (error) {
      print("Đã xảy ra lỗi khi đăng bài: $error");
    }
  }
}
