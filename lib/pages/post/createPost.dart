import 'dart:convert';
import 'dart:io';
import 'package:ai_journey/config/app_storage.dart';
import 'package:ai_journey/config/http_client.dart';
import 'package:ai_journey/models/connectapi/post.dart';
import 'package:ai_journey/pages/home/home_page.dart';
import 'package:ai_journey/pages/login/components/login_form_widget.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  final TextEditingController _contextController = TextEditingController();
  late String accessToken;

  XFile? image;
  final httpService = HttpService(url);

  final ImagePicker picker = ImagePicker();
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }

  // Future<Posts> fetchAlbum() async {
  //   final response = await http.get(Uri.parse(login));
  //   final Map<String, dynamic> jsonData = jsonDecode(response.body);

  //   final accessToken = jsonData['data']['access_token'];
  //   print(accessToken);

  //   if (response.statusCode == 200) {
  //     return Posts.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  //   } else {
  //     throw Exception('Failed to load album');
  //   }
  // }

  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  // Future<String?> gettoken() async {
  //   try {
  //     // Gửi yêu cầu HTTP để lấy activationToken
  //     final response = await http.get(Uri.parse(activationToken));

  //     // Kiểm tra xem yêu cầu có thành công không
  //     if (response.statusCode == 200) {
  //       // Giải mã phản hồi JSON để lấy activationToken
  //       final jsonData = jsonDecode(response.body);
  //       final activationToken = jsonData['activationToken'];

  //       // Trả về activationToken
  //       return activationToken;
  //     } else {
  //       // Xử lý trường hợp không thành công (vd: báo lỗi)
  //       throw Exception('Failed to get activation token');
  //     }
  //   } catch (error) {
  //     // Xử lý các lỗi khác (vd: mất kết nối, lỗi hệ thống, ...)
  //     throw Exception('An error occurred: $error');
  //   }
  // }

  // Future<void> createpostUser(String authToken) async {
  //   var regBody = {
  //     "content": _contextController.text,
  //   };
  //   try {
  //     var response = await http.post(
  //       Uri.parse(post),
  //       headers: {
  //         "Content-Type": "application/json",
  //         "Authorization": "Bearer $authToken",
  //       },
  //       body: jsonEncode(regBody),
  //     );

  //     if (response.statusCode == 201) {
  //       print("Đăng bài thành công: ${response.body}");

  //       // Đăng ký thành công
  //     } else {
  //       print("Đăng bài không thành công: ${response.body}");
  //     }
  //   } catch (error) {
  //     print("Đăng nhập  thành công");
  //   }
  // }

  // Future<void> postUser(String authToken) async {
  //   var regBody = {
  //     "content": _contextController.text,
  //   };
  //   try {
  //     var response = await http.post(
  //       Uri.parse(post),
  //       headers: {
  //         "Content-Type": "application/json",
  //         "Authorization": "Bearer $authToken",
  //       },
  //       body: jsonEncode(regBody),
  //     );

  //     if (response.statusCode == 201) {
  //       print("Đăng bài thành công: ${response.body}");

  //       // Đăng ký thành công
  //     } else {
  //       print("Đăng bài không thành công: ${response.body}");
  //     }
  //   } catch (error) {
  //     print("Đăng nhập  thành công");
  //   }
  // }

  // Future<http.Response> createAlbum(String title) {
  //   return http.post(
  //     Uri.parse(post),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, String>{
  //       'content': title,
  //     }),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ListView(
          children: [
            // Phần bên trên
            SizedBox(height: 10),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                  SizedBox(width: 25), // Khoảng cách giữa icon và logo
                  const Text(
                    "Post",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(width: 125),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        // CustomImageFormField(
                        //   validator: (val) {},
                        //   onChanged: (_file) {},
                        // ),
                        ElevatedButton(
                          onPressed: () async {
                            await httpService.postUser(_contextController.text);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ),
                            );
                          },
                          child: const Text(
                            'Submit',
                            style: TextStyle(color: Colors.black),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.green),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // SizedBox(height: 20), // Khoảng cách giữa hai phần

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: TextFormField(
                      controller: _contextController,
                      decoration: const InputDecoration(
                        hintText: 'Write something your post',
                      ),
                      validator: (value) {
                        if (value!.isEmpty)
                          return 'Please, describe the problem';
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      myAlert();
                    },
                    child: Text('Upload Photo'),
                  ),
                  _contextController.text.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(
                              //to show image, you type like this.
                              File(image!.path),
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width,
                              height: 300,
                            ),
                          ),
                        )
                      : Text(
                          "No Image",
                          style: TextStyle(fontSize: 20),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class CustomImageFormField extends StatelessWidget {
//   CustomImageFormField({
//     Key? key,
//     required this.validator,
//     required this.onChanged,
//   }) : super(key: key);
//   final String? Function(File?) validator;
//   final Function(File) onChanged;
//   File? _pickedFile;
//   @override
//   Widget build(BuildContext context) {
//     return FormField<File>(
//         validator: validator,
//         builder: (formFieldState) {
//           return Column(
//             children: [
//               GestureDetector(
//                 onTap: () async {
//                   FilePickerResult? file = await FilePicker.platform
//                       .pickFiles(type: FileType.image, allowMultiple: true);
//                   if (file != null) {
//                     _pickedFile = File(file.files.first.path!);
//                     onChanged.call(_pickedFile!);
//                   }
//                 },
//               ),
//               if (formFieldState.hasError)
//                 Padding(
//                   padding: const EdgeInsets.only(left: 8, top: 10),
//                   child: Text(
//                     formFieldState.errorText!,
//                     style: TextStyle(
//                         fontStyle: FontStyle.normal,
//                         fontSize: 13,
//                         color: Colors.red[700],
//                         height: 0.5),
//                   ),
//                 )
//             ],
//           );
//         });
//   }
// }
