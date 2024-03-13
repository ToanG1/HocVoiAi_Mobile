import 'dart:io';
import 'package:ai_journey/config/app_storage.dart';
import 'package:ai_journey/config/http_client.dart';
import 'package:ai_journey/pages/home/home_page.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

import 'dart:async';

class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  final TextEditingController _contextController = TextEditingController();

  late String accessToken;

  XFile? image;
  List<String?> urlImage = [];
  final httpService = HttpService(url);

  final ImagePicker picker = ImagePicker();
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
    if (img != null) {
      //File file = File(img.path);
      String filePath = img.path;
      await httpService.uploadFile(filePath);
    }
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
                            // await httpService.uploadFile(image);

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
